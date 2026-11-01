import 'dart:math';

import 'package:cloud_mining_farm/modual/repository/start_time_rp.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/responsiv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

/*
class LiquidFillPainter extends CustomPainter {
  final double progress;
  final double wavePhase;
  final Color color;

  LiquidFillPainter({required this.progress, required this.wavePhase, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path();
    final waveHeight = size.height * 0.05;
    final baseHeight = size.height * (1 - progress);

    path.moveTo(0, baseHeight);

    for (double x = 0; x <= size.width; x++) {
      path.lineTo(x, baseHeight + sin((x / size.width * 2 * pi) + wavePhase) * waveHeight);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.clipPath(Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height)));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant LiquidFillPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.wavePhase != wavePhase;
  }
}
*/

class LiquidFillPainter extends CustomPainter {
  final double progress;
  final double wavePhase;
  final Gradient gradient;

  LiquidFillPainter({required this.progress, required this.wavePhase, required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    final waveHeight = size.height * 0.05;
    final baseHeight = size.height * (1 - progress);

    path.moveTo(0, baseHeight);

    for (double x = 0; x <= size.width; x++) {
      path.lineTo(x, baseHeight + sin((x / size.width * 2 * pi) + wavePhase) * waveHeight);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.clipPath(Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height)));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant LiquidFillPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.wavePhase != wavePhase ||
        oldDelegate.gradient != gradient;
  }
}

class LiquidMiningButton extends StatefulWidget {
  final StartTimeService timer;
  final VoidCallback onTap;
  final double progress;
  final String text;

  const LiquidMiningButton({
    super.key,
    required this.timer,
    required this.progress,
    required this.text,
    required this.onTap,
  });

  @override
  State<LiquidMiningButton> createState() => _LiquidMiningButtonState();
}

class _LiquidMiningButtonState extends State<LiquidMiningButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = context.responsive.heightPercent(18);
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        height: size,
        width: size,
        child: !widget.timer.isRunning
            ? StartButton()
            : Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (_, __) {
                      return CustomPaint(
                        size: Size(size, size),
                        painter: LiquidFillPainter(
                          progress: widget.progress.clamp(0.0, 1.0),
                          wavePhase: _controller.value * 2 * pi,
                          gradient: LinearGradient(
                            colors: [Color(0xffFF9800), Color(0xffF44336)],
                          ), // color: Color(0xffFF9800),
                        ),
                      );
                    },
                  ),

                  /// 🔵 Border + Glow
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(colors: [Color(0xffFF9800), Color(0xffF44336)]),
                        width: 6,
                      ),
                    ),
                  ),

                  /// 🟢 Text
                  Text(
                    widget.timer.isRunning
                        ? widget.timer.formatDuration(widget.timer.startTimeLeft.value)
                        : 'hsb'.tr,
                    style: textMontserrat(
                      context,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.responsive.heightPercent(18);

    return Center(
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: const GradientBoxBorder(
            gradient: LinearGradient(colors: [Color(0xffFF9800), Color(0xffF44336)]),
            width: 10,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.card,
              // border: Border.all(color: const Color(0xffFF9800), width: 3),
              border: const GradientBoxBorder(
                gradient: LinearGradient(colors: [Color(0xffF44336), Color(0xffFF9800)]),
                width: 3,
              ),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF3A3A3A), Color(0xFF1F1F1F)],
              ),
            ),
            child: Center(
              child: Text(
                'hsb'.tr,
                style: textMontserrat(
                  context,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColor.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
