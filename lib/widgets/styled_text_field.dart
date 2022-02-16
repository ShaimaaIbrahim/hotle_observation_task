import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class StyledTextField extends StatelessWidget {
  final keyboardType;
  final isPassword;
  final hint;
  final controller;
  final validator;
  final textAlign;
  final Color? fillColor;
  final bool obsecure;

  // final double? borderRadius;
  final double? borderPadding;
  final Widget? suffixWidget;
  final Function? onIconPressed;
  final Function? onChange;
  final hintStyle;
  final int? maxLines;
  final bool? editable;
  final BorderRadius? borderRadius;
  final double? width;

  const StyledTextField({
    required this.obsecure,
    this.width,
    this.hintStyle,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.hint,
    this.validator,
    this.onChange,
    this.borderPadding,
    this.textAlign = TextAlign.start,
    this.fillColor,
    this.borderRadius,
    this.suffixWidget,
    this.onIconPressed,
    this.maxLines,
    this.editable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.w,
      child: TextFormField(
        textAlign: textAlign,
        controller: controller,
        keyboardType: keyboardType,
        style: textFieldTextStyle,
        onChanged: (value) {
          if (value.length > 100) {}
        },
        obscureText: obsecure,
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: borderPadding ?? 5.w, vertical: 5.h),
          hintText: hint,
          enabled: editable!,
          filled: true,
          fillColor: Colors.white,
          hintStyle: hintStyle == null ? smallStyle : hintStyle,
          border: OutlineInputBorder(
            borderRadius: borderRadius == null
                ? BorderRadius.circular(8.r)
                : borderRadius!,
            borderSide: BorderSide(
              color: whiteColor,
            ),
          ),
          // suffixIcon: Container(
          //   padding: EdgeInsets.all(5.w),
          //   child: suffixWidget,
          // ),
          //      prefixIcon: suffixWidget,
          // prefixIconConstraints: BoxConstraints(
          //        maxHeight: 40.h,
          //        maxWidth: 20.w,
          //      ),
        ),
        validator: validator,
      ),
    );
  }
}
