import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class NoData extends StatelessWidget {
  final String? text;
  final double? top;
  final bool? isCenter;

  const NoData({super.key, this.text = '', this.top = 0.0, this.isCenter = false});

  @override
  Widget build(BuildContext context) {
    return isCenter == true
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAsset.history, scale: 7, color: AppColor.subText.withAlpha(150)),
              10.heightBox,
              text?.isEmpty ?? true
                  ? Text(
                      'whr'.tr,
                      textAlign: TextAlign.center,
                      style: subTextPoppins(
                        context,
                        fontSize: 13,
                        color: AppColor.subText.withAlpha(200),
                      ),
                    )
                  : Text(
                      text ?? "",
                      textAlign: TextAlign.center,
                      style: subTextPoppins(
                        context,
                        fontSize: 13,
                        color: AppColor.subText.withAlpha(200),
                      ),
                    ),
            ],
          )
        : Padding(
            padding: EdgeInsets.only(top: top ?? 50),
            child: Column(
              children: [
                Image.asset(AppAsset.history, scale: 8, color: AppColor.subText.withAlpha(150)),
                10.heightBox,
                text?.isEmpty ?? true
                    ? Text(
                        'whr'.tr,
                        textAlign: TextAlign.center,
                        style: subTextPoppins(
                          context,
                          fontSize: 13,
                          color: AppColor.subText.withAlpha(200),
                        ),
                      )
                    : Text(
                        text ?? "",
                        textAlign: TextAlign.center,
                        style: subTextPoppins(
                          context,
                          fontSize: 13,
                          color: AppColor.subText.withAlpha(200),
                        ),
                      ),
              ],
            ),
          );
  }
}

class CustomSlideButton extends StatefulWidget {
  final VoidCallback onSlideComplete;

  const CustomSlideButton({super.key, required this.onSlideComplete});

  @override
  State<CustomSlideButton> createState() => _CustomSlideButtonState();
}

class _CustomSlideButtonState extends State<CustomSlideButton> with TickerProviderStateMixin {
  double _dragPosition = 5;
  bool _isLoading = false;

  final double _totalWidth = 200;
  final double _thumbSize = 36;

  late final AnimationController _animationController;
  late AnimationController _slideController;
  late Animation<double> _slideAnimation;

  double get _progress => (_dragPosition - 5) / (_totalWidth - _thumbSize - 10);

  double get _rotationAngle => _progress.clamp(0.0, 1.0) * 3.1415926535;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(seconds: 1), vsync: this)
      ..repeat(reverse: true);

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (!_isLoading) {
      setState(() => _isLoading = true);

      _slideAnimation =
          Tween<double>(
            begin: _dragPosition,
            end: _totalWidth - _thumbSize - 10,
          ).animate(_slideController)..addListener(() {
            setState(() {
              _dragPosition = _slideAnimation.value;
            });
          });

      _slideController.forward().then((_) {
        widget.onSlideComplete();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _totalWidth,
      height: 50,
      decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(25)),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              final offset = 8 * (_animationController.value);
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Transform.translate(
                      offset: Offset(offset, 0),
                      child: Text(
                        'Slide to Start',
                        style: textRoboto(
                          context,
                          fontSize: 17,
                          color: AppColor.primaryText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    2.widthBox,
                    Transform.translate(
                      offset: Offset(offset, 0),
                      child: Icon(Icons.double_arrow_sharp, size: 24, color: AppColor.primaryText),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            left: _dragPosition,
            child: GestureDetector(
              onHorizontalDragUpdate: _onDragUpdate,
              child: Transform.rotate(
                angle: _rotationAngle,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xffFF9A12),
                  child: _isLoading
                      ? SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            color: AppColor.primaryText,
                            strokeWidth: 2,
                          ),
                        )
                      : FaIcon(
                          FontAwesomeIcons.arrowRightLong,
                          color: AppColor.primaryText,
                          size: 20,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BlinkingGreenDot extends StatefulWidget {
  const BlinkingGreenDot({super.key});

  @override
  BlinkingGreenDotState createState() => BlinkingGreenDotState();
}

class BlinkingGreenDotState extends State<BlinkingGreenDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this)
      ..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.2, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: AppColor.success, // Lime Green
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
