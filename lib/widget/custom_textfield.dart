import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Widget? suffixIcon;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? prefix;
  final String? labelText;
  final TextStyle? labelStyle;
  final bool? readOnly;
  final AutovalidateMode? autoValidateMode;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isShadow;
  final bool? isBorderStyle;
  final bool? isSuffix;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextCapitalization? textCapitalization;
  final TextStyle? style;
  final bool? enableInteractiveSelection;
  final BoxConstraints? prefixIconConstraints;


  const CommonTextField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.hintStyle,
    this.prefixIcon,
    this.prefix,
    this.labelText,
    this.labelStyle,
    this.readOnly = false,
    this.autoValidateMode,
    this.contentPadding,
    this.textInputAction,
    this.isShadow = false,
    this.isSuffix = false,
    this.inputFormatters,
    this.isBorderStyle = false,
    this.maxLines,
    this.textAlign,
    this.textCapitalization,
    this.style,
    this.enableInteractiveSelection,
    this.prefixIconConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: enableInteractiveSelection,
      inputFormatters: inputFormatters,
      cursorColor:AppColor.text,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      autovalidateMode: AutovalidateMode.disabled,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      controller: controller,
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: keyboardType,
      onChanged: onChanged,
      maxLines: maxLines,
      validator: validator,
      textInputAction: textInputAction ?? TextInputAction.next,
      style: textRoboto(context, fontSize: 16),
      autocorrect: true,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        disabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        errorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        focusedErrorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        hintText: hintText,
        hintStyle: subTextMontserrat(context,
            fontSize: 15, color: AppColor.subText.withAlpha(200)),
        errorStyle: subTextPoppins(context, fontSize: 13, color: AppColor.error),
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        prefix: prefix,
        suffixIcon: suffixIcon,
        border: InputBorder.none,
        fillColor: AppColor.card,
        filled: true,
      ),
    );
  }
}
