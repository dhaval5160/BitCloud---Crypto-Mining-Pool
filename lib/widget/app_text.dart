import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final double? height;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? wordSpacing;
  final FontStyle? fontStyle;
  final bool? softWrap;

  const AppText(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.height,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
    this.wordSpacing,
    this.fontFamily,
    this.fontStyle,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      style: TextStyle(
        color: color ?? Colors.black,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontStyle: fontStyle,
        height: height,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        fontFamily: fontFamily,
        // fontFamily: fontFamily ?? AssetsPath.playpenSans,
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  final Widget child;
  final bool? isPadding;
  final bool? isPaddingZero;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;

  const CardContainer({
    super.key,
    required this.child,
    this.isPadding = false,
    this.isPaddingZero = false,
    this.color,
    this.borderRadius,
    this.margin,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: isPaddingZero == true
          ? EdgeInsets.zero
          : isPadding == true
          ? EdgeInsets.symmetric(vertical: 10)
          : EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        color: color ?? AppColor.card,
        border: border,
      ),
      child: child,
    );
  }
}

class AppButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String? text;
  final GestureTapCallback onTap;
  final Widget? child;

  const AppButton({
    super.key,
    this.color,
    this.textColor,
    required this.onTap,
    this.text,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color ?? AppColor.primaryButton,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child:
              child ??
              Text(
                text ?? '',
                textAlign: TextAlign.center,
                style: textMontserrat(
                  context,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor ?? AppColor.primaryText,
                ),
              ),
        ),
      ),
    );
  }
}

class AppButtonSmall extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final GestureTapCallback onTap;
  final Color? color;
  final Color? textColor;
  final String? text;
  final BoxBorder? border;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;

  const AppButtonSmall({
    super.key,
    this.color,
    this.border,
    this.text,
    required this.onTap,
    required this.padding,
    this.child,
    this.borderRadius,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          color: color ?? AppColor.primaryButton,
        ),
        child: Padding(
          padding: padding,
          child:
              child ??
              Text(text ?? '', style: textRoboto(context, color: textColor ?? AppColor.text)),
        ),
      ),
    );
  }
}

AppBar buildCustomAppBar(
  BuildContext context, {
  String? title,
  double? toolbarHeight,
  List<Widget>? actions,
  bool showFullAppBar = true,
  bool leadingIcon = true,
}) {
  if (!showFullAppBar) {
    return AppBar(backgroundColor: AppColor.background, elevation: 0, toolbarHeight: 0);
  }

  return AppBar(
    elevation: 0,
    toolbarHeight: toolbarHeight ?? 40,
    centerTitle: true,
    backgroundColor: AppColor.background,
    leading: leadingIcon
        ? IconButton(
            icon: FaIcon(FontAwesomeIcons.arrowLeftLong, color: AppColor.white),
            onPressed: () {
              InterstitialAdManager().showInterstitialByBackCount();
              Navigation.pop();
            },
          )
        : SizedBox.shrink(),
    title: Text(
      title ?? "",
      style: textMontserrat(
        context,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColor.white,
      ),
    ),
    actions: actions,
  );
}

PreferredSizeWidget commonAppBar() {
  return AppBar(
    backgroundColor: AppColor.background,
    automaticallyImplyLeading: false,
    elevation: 0,
    toolbarHeight: 0,
    title: null,
  );
}

class CustomAppBar extends StatelessWidget {
  final String? text;
  final GestureTapCallback? onTap;

  const CustomAppBar({super.key, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return HorizontalPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap,
            child: FaIcon(
              FontAwesomeIcons.arrowLeftLong,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Text(
            text ?? "",
            style: textMontserrat(context, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          FaIcon(FontAwesomeIcons.arrowLeftLong, color: Colors.transparent),
        ],
      ),
    );
  }
}
