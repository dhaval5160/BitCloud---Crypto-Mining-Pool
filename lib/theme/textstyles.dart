import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:flutter/material.dart';

import 'config.dart';

TextStyle textMontserrat(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  double? height,
}) {
  return TextStyle(
    color: color ?? AppColor.text,
    fontFamily: AppConfig.montserrat,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? 14,
    height: height,
  );
}

TextStyle subTextMontserrat(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextStyle(
    color: color ?? AppColor.subText,
    fontFamily: AppConfig.montserrat,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? 14,
  );
}

TextStyle textRoboto(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextStyle(
    color: color ?? AppColor.text,
    fontFamily: AppConfig.roboto,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? 14,
  );
}

TextStyle subTextRoboto(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextStyle(
    color: color ?? AppColor.subText,
    fontFamily: AppConfig.roboto,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? 14,
  );
}

TextStyle textPoppins(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextStyle(
    color: color ?? AppColor.text,
    fontFamily: AppConfig.poppins,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? 14,
  );
}

TextStyle subTextPoppins(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextStyle(
    color: color ?? AppColor.subText,
    fontFamily: AppConfig.montserrat,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? 14,
  );
}
