import 'package:credit_yodha/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget {
  final String? title;
  final TextStyle? textStyle;
  final GestureTapCallback? onTap;
  final Color? color;
  final Color? fontColor;
  final double? height;
  final double? width;
  final double? fontSize;

  const CommonButton(
      {super.key, this.title, this.textStyle, this.onTap, this.color, this.width, this.height, this.fontColor, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10.h),
        height: height ?? 50.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: color ?? AppColors.primary,
        ),
        child: Text(
          title ?? '',
          textAlign: TextAlign.center,
          style: textStyle ?? TextStyle(color: fontColor ?? AppColors.white, fontSize: fontSize ?? 14.sp ),
        ),
      ),
    );
  }
}
