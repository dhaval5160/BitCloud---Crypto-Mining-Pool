import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/*class InitializationHelper {
  Future<FormError?> initialize() async {
    final completer = Completer<FormError?>();

    final params = ConsentRequestParameters(tagForUnderAgeOfConsent: false);
    ConsentInformation.instance.requestConsentInfoUpdate(
      params,
      () async {
        final isFormAvailable = await ConsentInformation.instance.isConsentFormAvailable();

        if (isFormAvailable) {
          final error = await _loadConsentForm();
          completer.complete(error);
        } else {
          await _initialize();
          completer.complete();
        }
      },
      (error) {
        completer.complete(error);
      },
    );

    return completer.future;
  }

  Future<FormError?> _loadConsentForm() async {
    final completer = Completer<FormError?>();

    ConsentForm.loadConsentForm(
      (consentForm) async {
        final status = await ConsentInformation.instance.getConsentStatus();

        if (status == ConsentStatus.required) {
          consentForm.show((formError) async {
            if (formError != null) {
              completer.complete(formError);
            } else {
              final updatedStatus = await ConsentInformation.instance.getConsentStatus();

              if (updatedStatus == ConsentStatus.obtained || updatedStatus == ConsentStatus.notRequired) {
                await _initialize();
                completer.complete();
              } else {
                final retryError = await _loadConsentForm();
                completer.complete(retryError);
              }
            }
          });
        } else {
          await _initialize();
          completer.complete();
        }
      },
      (formError) {
        completer.complete(formError);
      },
    );

    return completer.future;
  }

  Future<void> _initialize() async {
    await MobileAds.instance.initialize();
  }
}*/

class InitializationHelper {
  static Future<bool>? _pending;
  static bool adsReady = false;

  Future<bool> initialize() {
    return _pending ??= _initialize();
  }

  Future<bool> _initialize() async {
    try {
      final consentCompleter = Completer<void>();

      ConsentInformation.instance.requestConsentInfoUpdate(
        ConsentRequestParameters(tagForUnderAgeOfConsent: false),
        () {
          if (!consentCompleter.isCompleted) {
            consentCompleter.complete();
          }
        },
        (error) {
          if (!consentCompleter.isCompleted) {
            consentCompleter.complete();
          }
        },
      );

      await consentCompleter.future;

      final formCompleter = Completer<void>();

      ConsentForm.loadAndShowConsentFormIfRequired((error) {
        if (!formCompleter.isCompleted) {
          formCompleter.complete();
        }
      });

      await formCompleter.future;

      final canRequestAds = await ConsentInformation.instance.canRequestAds();

      if (!canRequestAds) {
        return false;
      }

      // Next-Gen SDK must be initialized first.
      await MobileAds.instance.initialize();

      if (kDebugMode) {
        await MobileAds.instance.updateRequestConfiguration(
          RequestConfiguration(testDeviceIds: ['2A581A06FDB24097186284D628763E8C']),
        );
      }

      adsReady = true;
      return true;
    } catch (error) {
      adsReady = false;
      return false;
    } finally {
      _pending = null;
    }
  }
}
