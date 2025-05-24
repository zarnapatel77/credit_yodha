import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget {
  final String? title;
  final TextStyle? textStyle;
  final GestureTapCallback onTap;

  final Color? color;

  const CommonButton(
      {super.key, this.title, this.textStyle, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10.h),
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: color!,
        ),
        child: Text(
          title ?? '',
          textAlign: TextAlign.center,
          style: textStyle ?? const TextStyle(),
        ),
      ),
    );
  }
}
