import 'dart:math';

import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/big_native.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/modual/model/user_model.dart';
import 'package:cloud_mining_farm/modual/service/api_service.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/app_navigation.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SystemInitializationScreen extends StatefulWidget {
  const SystemInitializationScreen({super.key});

  @override
  State<SystemInitializationScreen> createState() => _SystemInitializationScreenState();
}

class _SystemInitializationScreenState extends State<SystemInitializationScreen> with TickerProviderStateMixin {
  final HomeCtrl homeCtrl = Get.find<HomeCtrl>();

  late AnimationController _rotationController;
  late AnimationController _pulseController;
  late AnimationController _buttonController;
  late AnimationController _loadingTextController;

  final ScrollController _scrollController = ScrollController();

  String loadingText = 'INITIALIZING SYSTEM';

  double progress = 0.0;

  bool isInitialized = false;

  final List<String> consoleLogs = [];

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
      lowerBound: 0.94,
      upperBound: 1.06,
    )..repeat(reverse: true);

    _rotationController = AnimationController(vsync: this, duration: const Duration(seconds: 8))..repeat();

    _buttonController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    _loadingTextController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))
      ..repeat(reverse: true);

    startInitialization();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotationController.dispose();
    _buttonController.dispose();
    _scrollController.dispose();
    _loadingTextController.dispose();
    super.dispose();
  }

  void _addLog(String text) {
    if (!mounted) return;

    setState(() {
      consoleLogs.add(text);
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void updateStatus(String text, double value, {String? log}) {
    if (!mounted) return;

    setState(() {
      loadingText = text;
      progress = value;
    });

    if (log != null) {
      _addLog(log);
    }
  }

  startingHandle() async {
    final bool? isLoggedIn = HiveService().getData<bool>(AppConfig.isLogin);

    if (isLoggedIn == true) {
      homeCtrl.userActiveSubList.clear();
      final UserProfileModel userProfileModel = await ApiRepo.userLogin(
        email: HiveService().getData<String>(AppConfig.userEmail),
        reference: '',
        firstTime: '',
      );

      homeCtrl.btcBalance.value = double.parse(userProfileModel.totalBtcDirect.toString());
      homeCtrl.miningBtcValue.value = double.parse(userProfileModel.totalBtcDirect.toString());
      homeCtrl.inviteBtcBalance.value = double.parse(userProfileModel.totalBtcRefrence.toString());
      homeCtrl.userActiveSubList.addAll(userProfileModel.subscription ?? []);
      AppConfig.mingTimer = userProfileModel.mingTimer ?? 1800;
      AppConfig.factorFast = userProfileModel.factorFast ?? 0.00000000001;
      AppConfig.factorRegular = userProfileModel.factorRegular ?? 0.000000000001;
      AppConfig.factorMedium = userProfileModel.factorMedium ?? 0.0000000000001;
      AppConfig.factorSlow = userProfileModel.factorSlow ?? 0.00000000000001;
      AppConfig.factorUltraSlow = userProfileModel.factorUltraSlow ?? 0.000000000000001;
      AppConfig.miningIntervals = userProfileModel.miningIntervals ?? 60;
      AppConfig.userProfileId = userProfileModel.profileId ?? "";
      AppConfig.referralCode = userProfileModel.profileRefrenceCode ?? "";
    }
  }

  Future<void> startInitialization() async {
    final random = Random();

    final int randomMilliseconds = 4000 + random.nextInt(1001);

    final Duration targetDuration = Duration(milliseconds: randomMilliseconds);

    final stopwatch = Stopwatch()..start();

    try {
      updateStatus('INITIALIZING SYSTEM', 0.10, log: 'Core system initialized');

      await Future.delayed(const Duration(milliseconds: 350));

      updateStatus('CHECKING SECURE SESSION', 0.25, log: 'Reading local secure storage');

      await Future.delayed(const Duration(milliseconds: 350));

      final bool? isLoggedIn = HiveService().getData<bool>(AppConfig.isLogin);

      if (isLoggedIn == true) {
        updateStatus('CONNECTING TO CLOUD', 0.40, log: 'Connecting to Bit Cloud server');

        await Future.delayed(const Duration(milliseconds: 250));

        // Real API / user data loading
        await startingHandle();

        updateStatus('SYNCHRONIZING PROFILE', 0.70, log: 'User profile synchronized');

        await Future.delayed(const Duration(milliseconds: 250));

        updateStatus('PREPARING MINING ENGINE', 0.90, log: 'Mining configuration loaded');

        await Future.delayed(const Duration(milliseconds: 200));
      } else {
        updateStatus('PREPARING GUEST SESSION', 0.80, log: 'No active user session found');

        await Future.delayed(const Duration(milliseconds: 400));
      }

      updateStatus('FINALIZING SYSTEM', 0.95, log: 'Completing initialization');

      // ==================================================
      // WAIT ONLY FOR THE REMAINING RANDOM TIME
      // ==================================================

      final Duration elapsed = stopwatch.elapsed;

      if (elapsed < targetDuration) {
        await Future.delayed(targetDuration - elapsed);
      }

      // ==================================================
      // COMPLETE
      // ==================================================

      updateStatus('SYSTEM READY', 1.0, log: 'Initialization completed successfully');

      await Future.delayed(const Duration(milliseconds: 250));

      if (!mounted) return;

      setState(() {
        isInitialized = true;
      });

      _buttonController.forward();
    } catch (e) {
      debugPrint('Initialization Error: $e');

      updateStatus('SYSTEM READY', 1.0, log: 'System started in recovery mode');

      // Keep the screen visible for the random target duration
      final Duration elapsed = stopwatch.elapsed;

      if (elapsed < targetDuration) {
        await Future.delayed(targetDuration - elapsed);
      }

      if (!mounted) return;

      setState(() {
        isInitialized = true;
      });

      _buttonController.forward();
    } finally {
      stopwatch.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              20.heightBox,
              _buildLogBox().px(15),
              15.heightBox,
              _buildProgress().px(15),
              15.heightBox,
              _buildStatusTitle().px(15),
              25.heightBox,
              Container(
                  decoration: BoxDecoration(
                    color: AppColor.card,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.divider.withAlpha(120)),
                  ),
                  child: BigNative()).px(15),
              25.heightBox,
              _buildStartButton().px(15),
              30.heightBox,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusTitle() {
    final String subtitle = isInitialized ? 'Your Bit Cloud system is ready' : _getStatusDescription();

    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 450),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (Widget child, Animation<double> animation) {
            final slideAnimation = Tween<Offset>(begin: const Offset(0, 0.35), end: Offset.zero).animate(animation);

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(position: slideAnimation, child: child),
            );
          },
          child: Text(
            loadingText,
            key: ValueKey(loadingText),
            textAlign: TextAlign.center,
            style: textMontserrat(
              context,
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: isInitialized ? AppColor.success : AppColor.text,
            ).copyWith(letterSpacing: 1.1, height: 1.2),
          ),
        ),

        const SizedBox(height: 5),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(begin: const Offset(0, 0.20), end: Offset.zero).animate(animation),
                child: child,
              ),
            );
          },
          child: Text(
            subtitle,
            key: ValueKey(subtitle),
            textAlign: TextAlign.center,
            style: textRoboto(context, fontSize: 12, fontWeight: FontWeight.w400, color: AppColor.subText).copyWith(height: 1.4),
          ),
        ),
      ],
    );
  }

  Widget _buildProgress() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.divider.withAlpha(120)),
      ),
      child: Column(
        children: [
          10.heightBox,
          Row(
            children: [
              Text(
                'SYSTEM PROGRESS',
                style: textRoboto(
                  context,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColor.subText,
                ).copyWith(letterSpacing: 1),
              ),

              const Spacer(),

              Text(
                '${(progress * 100).toInt()}%',
                style: textMontserrat(
                  context,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: isInitialized ? AppColor.success : AppColor.primaryButton,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(end: progress),
              duration: const Duration(milliseconds: 400),
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value,
                  minHeight: 6,
                  backgroundColor: AppColor.background,
                  valueColor: AlwaysStoppedAnimation<Color>(isInitialized ? AppColor.success : AppColor.primaryButton),
                );
              },
            ),
          ),
          15.heightBox,
        ],
      ),
    );
  }

  Widget _buildLogBox() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.divider.withAlpha(120)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
            decoration: BoxDecoration(
              color: AppColor.background.withAlpha(80),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Row(
              children: [
                Icon(Icons.terminal_rounded, size: 18, color: AppColor.primaryButton),

                const SizedBox(width: 8),

                Text(
                  'SYSTEM LOG',
                  style: textRoboto(
                    context,
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: AppColor.subText,
                  ).copyWith(letterSpacing: 1),
                ),

                const Spacer(),

                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isInitialized ? AppColor.success : AppColor.primaryButton,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              itemCount: consoleLogs.length,
              itemBuilder: (context, index) {
                final bool isLast = index == consoleLogs.length - 1;

                return Row(
                  children: [
                    Text(
                      '> ',
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 15, color: AppColor.primaryButton),
                    ),
                    5.widthBox,
                    Expanded(
                      child: Text(
                        consoleLogs[index],
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: isLast ? AppColor.text : AppColor.subText,
                          fontWeight: isLast ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartButton() {
    return SizedBox(
      height: 43,
      width: double.infinity,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(scale: Tween<double>(begin: 0.96, end: 1.0).animate(animation), child: child),
          );
        },
        child: isInitialized
            ? FadeTransition(
                key: const ValueKey('startButton'),
                opacity: _buttonController,
                child: GestureDetector(
                  onTap: () {
                    Navigation.pushNamed(Routes.bottomPage);
                    InterstitialAdManager().showInterstitialAds();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.primaryButton,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(color: AppColor.primaryButton.withAlpha(45), blurRadius: 18, offset: const Offset(0, 6)),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'GET START',
                          style: textMontserrat(
                            context,
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: AppColor.black,
                          ).copyWith(letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : AnimatedBuilder(
                key: const ValueKey('initializing'),
                animation: _loadingTextController,
                builder: (context, child) {
                  final value = _loadingTextController.value;

                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.card,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColor.primaryButton.withAlpha(60 + (value * 100).toInt())),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.primaryButton.withAlpha(10 + (value * 45).toInt()),
                          blurRadius: 8 + (value * 16),
                          spreadRadius: value * 1.5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 17,
                          width: 17,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            strokeCap: StrokeCap.round,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColor.primaryButton.withAlpha(180 + (value * 75).toInt()),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Text(
                          'INITIALIZING...',
                          style: textMontserrat(context, fontSize: 14, fontWeight: FontWeight.w800, color: AppColor.primaryButton)
                              .copyWith(
                                letterSpacing: 1.5,
                                shadows: [
                                  Shadow(
                                    color: AppColor.primaryButton.withAlpha(80 + (value * 175).toInt()),
                                    blurRadius: 4 + (value * 12),
                                  ),
                                ],
                              ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

  String _getStatusDescription() {
    switch (loadingText) {
      case 'INITIALIZING SYSTEM':
        return 'Preparing the Bit Cloud environment';

      case 'CHECKING SECURE SESSION':
        return 'Verifying your secure local session';

      case 'CONNECTING TO CLOUD':
        return 'Connecting to the Bit Cloud network';

      case 'SYNCHRONIZING PROFILE':
        return 'Loading your account and mining data';

      case 'PREPARING MINING ENGINE':
        return 'Configuring your mining environment';

      case 'PREPARING GUEST SESSION':
        return 'Setting up your guest environment';

      case 'SYSTEM READY':
        return 'Everything is ready to start mining';

      default:
        return 'Preparing your secure mining environment';
    }
  }
}
