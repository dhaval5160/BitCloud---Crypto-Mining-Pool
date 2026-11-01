import 'dart:async';

import 'package:cloud_mining_farm/theme/config.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

class SubscriptionService {
  SubscriptionService._internal();

  static final SubscriptionService _instance = SubscriptionService._internal();

  factory SubscriptionService() => _instance;

  final InAppPurchase _iap = InAppPurchase.instance;
  bool _initialized = false;
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  List<ProductDetails> products = [];
  final ValueNotifier<bool> isLoading = ValueNotifier(true);
  final ValueNotifier<bool?> isAutoRenewing = ValueNotifier(null);

  final ValueNotifier<List<PurchaseDetails>> activeSubscriptions = ValueNotifier([]);

  Completer<PurchaseResult>? _purchaseCompleter;

  // --- Initialization ---
  Future<void> init() async {
    if (_initialized) return;

    final available = await _iap.isAvailable();
    if (!available) {
      isLoading.value = false;
      return;
    }

    final productIds = AppConfig.spIdData?.listSpId ?? [''];
    if (productIds.isEmpty) {
      isLoading.value = false;
      return;
    }

    final response = await _iap.queryProductDetails(productIds.toSet());
    products = response.productDetails;

    // Store stream subscription so it can be managed cleanly
    _subscription = _iap.purchaseStream.listen(
      _onPurchaseUpdated,
      onDone: () {
        _subscription?.cancel();
      },
      onError: (error) {
        if (_purchaseCompleter != null && !_purchaseCompleter!.isCompleted) {
          _purchaseCompleter?.complete(
            PurchaseResult(
              success: false,
              status: "error",
              token: "",
              transactionDate: "",
              message: "Purchase stream error: ${error.toString()}",
            ),
          );
          _purchaseCompleter = null;
        }
      },
    );

    _initialized = true;
    isLoading.value = false;
  }

  // --- Buy product ---
  Future<PurchaseResult> buy(String productId) async {
    final product = products.firstWhere((p) => p.id == productId, orElse: () => throw Exception("Product not found: $productId"));

    final purchaseParam = PurchaseParam(productDetails: product);
    _purchaseCompleter = Completer<PurchaseResult>();

    // Triggers purchase flow
    _iap.buyNonConsumable(purchaseParam: purchaseParam);

    return _purchaseCompleter!.future;
  }

  // --- Purchase update handler ---
  void _onPurchaseUpdated(List<PurchaseDetails> purchases) async {
    final active = purchases.where((p) => p.status == PurchaseStatus.purchased || p.status == PurchaseStatus.restored).toList();

    if (active.isNotEmpty) {
      activeSubscriptions.value = active;
    }

    for (final purchase in purchases) {
      bool? autoRenew;
      if (purchase is GooglePlayPurchaseDetails) {
        autoRenew = purchase.billingClientPurchase.isAutoRenewing;
      }
      isAutoRenewing.value = autoRenew;

      switch (purchase.status) {
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          // ALWAYS complete purchase to prevent Google Play auto-refunds after 3 days
          if (purchase.pendingCompletePurchase) {
            await _iap.completePurchase(purchase);
          }

          _completePurchaseResult(
            _buildPurchaseResult(purchase: purchase, success: true, message: "Purchase completed successfully"),
          );
          break;

        case PurchaseStatus.pending:
          // Keep waiting for pending purchases; don't complete the future as failed yet
          if (kDebugMode) {
            print("Purchase pending: ${purchase.productID}");
          }
          break;

        case PurchaseStatus.canceled:
          isAutoRenewing.value = null;
          _completePurchaseResult(_buildPurchaseResult(purchase: purchase, success: false, message: "Purchase was canceled"));
          break;

        case PurchaseStatus.error:
          isAutoRenewing.value = null;
          _completePurchaseResult(
            _buildPurchaseResult(
              purchase: purchase,
              success: false,
              message: purchase.error?.message ?? "Unknown error occurred",
            ),
          );
          break;
      }
    }
  }

  // --- Helper to complete the future safely without null errors ---
  void _completePurchaseResult(PurchaseResult result) {
    if (_purchaseCompleter != null && !_purchaseCompleter!.isCompleted) {
      _purchaseCompleter!.complete(result);
      _purchaseCompleter = null;
    }
  }

  // --- Restore Purchases (Standard Flutter Cross-Platform Implementation) ---
  Future<void> restorePurchases() async {
    try {
      await _iap.restorePurchases();
    } catch (_) {}
  }

  bool isCurrentlyAutoRenewing(String productId) {
    try {
      final purchase = activeSubscriptions.value.firstWhere(
        (p) => p.productID == productId,
        orElse: () => throw Exception("No active subscription found for $productId"),
      );

      if (purchase is GooglePlayPurchaseDetails) {
        return purchase.billingClientPurchase.isAutoRenewing;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error checking auto-renew status: $e");
      }
    }
    return false;
  }

  // --- Helper: Build PurchaseResult ---
  PurchaseResult _buildPurchaseResult({required PurchaseDetails purchase, required bool success, required String message}) {
    return PurchaseResult(
      success: success,
      status: purchase.status.name,
      token: purchase.verificationData.serverVerificationData,
      transactionDate: purchase.transactionDate,
      purchaseId: purchase.purchaseID,
      originalJson: (purchase is GooglePlayPurchaseDetails) ? purchase.billingClientPurchase.originalJson : null,
      productId: purchase.productID,
      message: message,
    );
  }

  void dispose() {
    _subscription?.cancel();
  }
}

class PurchaseResult {
  final bool success;
  final String status;
  final String? message;
  final String? token;
  final String? transactionDate;
  final String? purchaseId;
  final String? originalJson;
  final String? productId;

  PurchaseResult({
    required this.success,
    required this.status,
    required this.token,
    required this.transactionDate,
    this.message,
    this.purchaseId,
    this.originalJson,
    this.productId,
  });

  Map<String, dynamic> toJson() => {
    'success': success,
    'status': status,
    'message': message,
    'token': token,
    'transactionDate': transactionDate,
    'purchaseId': purchaseId,
    'originalJson': originalJson,
    'productId': productId,
  };
}

/*class SubscriptionService {
  SubscriptionService._internal();

  static final SubscriptionService _instance = SubscriptionService._internal();

  factory SubscriptionService() => _instance;

  final InAppPurchase _iap = InAppPurchase.instance;
  bool _initialized = false;

  static final List<String> _kProductIds = AppConfig.spIdData?.listSpId ?? [''];

  List<ProductDetails> products = [];
  final ValueNotifier<bool> isLoading = ValueNotifier(true);
  final ValueNotifier<bool?> isAutoRenewing = ValueNotifier(null);

  final ValueNotifier<List<PurchaseDetails>> activeSubscriptions = ValueNotifier([]);

  Completer<PurchaseResult>? _purchaseCompleter;

  // --- Initialization ---
  Future<void> init() async {
    if (_initialized) return;

    final available = await _iap.isAvailable();
    if (!available) {
      isLoading.value = false;
      return;
    }

    final response = await _iap.queryProductDetails(_kProductIds.toSet());
    products = response.productDetails;
    _iap.purchaseStream.listen(
      _onPurchaseUpdated,
      onDone: () {},
      onError: (error) {
        _purchaseCompleter?.complete(
          PurchaseResult(
            success: false,
            status: "error",
            token: "",
            transactionDate: "",
            message: "Purchase stream error",
          ),
        );
        _purchaseCompleter = null;
      },
    );

    _initialized = true;
    isLoading.value = false;
  }

  // --- Buy product and return purchase result ---
  Future<PurchaseResult> buy(String productId) async {
    final product = products.firstWhere((p) => p.id == productId, orElse: () => throw Exception("Product not found"));

    final purchaseParam = PurchaseParam(productDetails: product);
    _purchaseCompleter = Completer<PurchaseResult>();
    _iap.buyNonConsumable(purchaseParam: purchaseParam);
    return _purchaseCompleter!.future;
  }

  // --- Purchase update handler ---
  void _onPurchaseUpdated(List<PurchaseDetails> purchases) async {
    final active = purchases.where((p) => p.status == PurchaseStatus.purchased || p.status == PurchaseStatus.restored).toList();
    activeSubscriptions.value = active;

    for (final purchase in purchases) {
      bool? autoRenew;
      if (purchase is GooglePlayPurchaseDetails) {
        autoRenew = purchase.billingClientPurchase.isAutoRenewing;
      }
      isAutoRenewing.value = autoRenew;

      switch (purchase.status) {
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          if (purchase.pendingCompletePurchase) {
            await _iap.completePurchase(purchase);
          }
          _purchaseCompleter?.complete(
            _buildPurchaseResult(
              purchase: purchase,
              success: true,
              message: "Purchase completed",
            ),
          );
          break;

        case PurchaseStatus.pending:
          _purchaseCompleter?.complete(
            _buildPurchaseResult(
              purchase: purchase,
              success: false,
              message: "Purchase is pending",
            ),
          );
          break;

        case PurchaseStatus.canceled:
          isAutoRenewing.value = null;
          _purchaseCompleter?.complete(
            _buildPurchaseResult(
              purchase: purchase,
              success: false,
              message: "Purchase was canceled",
            ),
          );
          break;

        case PurchaseStatus.error:
          isAutoRenewing.value = null;
          _purchaseCompleter?.complete(
            _buildPurchaseResult(
              purchase: purchase,
              success: false,
              message: purchase.error?.message ?? "Unknown error",
            ),
          );
          break;
      }

      _purchaseCompleter = null;
    }
  }

  // --- Restore purchases ---
  // Future<void> restorePurchases() async {
  //   await _iap.restorePurchases();
  // }

*/ /*  Future<List<PurchaseDetails>> restorePurchases() async {
    final InAppPurchaseAndroidPlatformAddition androidAddition =
    _iap.getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();

    final purchases = await androidAddition.queryPastPurchases();

    // Filter only valid purchases
    final validPurchases = purchases.pastPurchases.where((purchase) =>
    purchase.status == PurchaseStatus.purchased ||
        purchase.status == PurchaseStatus.restored
    ).toList();

    return validPurchases;
  }*/ /*

*/ /*
  Future<void> restorePurchases() async {
    try {
      EasyLoading.show();

      final androidAddition = _iap.getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
      final purchases = await androidAddition.queryPastPurchases();

      final validPurchases = purchases.pastPurchases
          .where((purchase) =>
              purchase.status == PurchaseStatus.purchased || purchase.status == PurchaseStatus.restored)
          .toList();

      if (validPurchases.isEmpty) {
        EasyLoading.dismiss();
        return;
      }

      final email = HiveService().getData<String>(AppConfig.userEmail);
      await ApiRepo.userLogin(
        email: email,
        reference: '',
        firstTime: 'yes',
      );

      for (var result in validPurchases) {
        for (var element in homeCtrl.subscriptionPlanList) {
          for (var plansElement in element.plans ?? []) {
            if (plansElement.planId == result.productID) {
              await ApiRepo.getSubDetails(
                email: email,
                botType: element.planName,
                type: 'Paid',
                plan: element.planName,
                power: element.power.toString(),
                powerType: element.powerType,
                durationType: plansElement.planTime,
                durationSeconds: plansElement.durationSeconds.toString(),
                addTime: formatUtcMillisToLocal(result.transactionDate),
                token: result.verificationData.serverVerificationData,
                productID: result.productID,
                purchaseId: result.purchaseID,
                originalJson: result.billingClientPurchase.originalJson,
                purchaseStatus: result.status.name,
              );

              homeCtrl.activeHashRate.value +=
                  parseMiningPowerToGh("${element.power} ${element.powerType}");
            }
          }
        }
      }

      EasyLoading.dismiss();
    } catch (e, stackTrace) {
      AppException.showException(e, stackTrace);
    } finally {
      EasyLoading.dismiss();
    }
  }
*/ /*

  Future<List<PurchaseDetails>> restorePurchases() async {
    try {
      EasyLoading.show();

      final androidAddition = _iap.getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
      final purchases = await androidAddition.queryPastPurchases();

      final validPurchases = purchases.pastPurchases
          .where(
            (purchase) => purchase.status == PurchaseStatus.purchased || purchase.status == PurchaseStatus.restored,
          )
          .toList();

      return validPurchases;
    } catch (e, stackTrace) {
      AppException.showException(e, stackTrace);
      return [];
    } finally {
      EasyLoading.dismiss();
    }
  }

  // --- Helper: Build PurchaseResult from PurchaseDetails ---
  PurchaseResult _buildPurchaseResult({
    required PurchaseDetails purchase,
    required bool success,
    required String message,
  }) {
    return PurchaseResult(
      success: success,
      status: purchase.status.name,
      token: purchase.verificationData.serverVerificationData,
      transactionDate: purchase.transactionDate,
      purchaseId: purchase.purchaseID,
      originalJson: (purchase is GooglePlayPurchaseDetails) ? purchase.billingClientPurchase.originalJson : null,
      productId: purchase.productID,
      message: message,
    );
  }
}

// --- PurchaseResult Model ---
class PurchaseResult {
  final bool success;
  final String status;
  final String? message;
  final String? token;
  final String? transactionDate;
  final String? purchaseId;
  final String? originalJson;
  final String? productId;

  PurchaseResult({
    required this.success,
    required this.status,
    required this.token,
    required this.transactionDate,
    this.message,
    this.purchaseId,
    this.originalJson,
    this.productId,
  });

  Map<String, dynamic> toJson() => {
        'success': success,
        'status': status,
        'message': message,
        'token': token,
        'transactionDate': transactionDate,
        'purchaseId': purchaseId,
        'originalJson': originalJson,
        'productId': productId,
      };
}*/
