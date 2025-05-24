import 'package:credit_yodha/ui/utils/app_colors.dart';
import 'package:credit_yodha/ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonText extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final Color? clrfont;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final TextStyle? textStyle;
  final TextOverflow? textOverflow;
  final String? fontFamily;
  final bool? softWrap;

  const CommonText({
    super.key,
    required this.title,
    this.fontWeight,
    this.fontStyle,
    this.fontSize,
    this.clrfont,
    this.maxLines,
    this.textAlign,
    this.textDecoration,
    this.textStyle,
    this.textOverflow,
    this.fontFamily,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaleFactor: 1.0,
      softWrap: softWrap,
      //-- will not change if system fonts size changed
      maxLines: maxLines ?? 1,
      textAlign: textAlign ?? TextAlign.start,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: textStyle ??
          TextStyle(
              fontFamily: fontFamily ?? TextStyles.fontFamily,
              fontWeight: fontWeight ?? TextStyles.fwRegular,
              fontSize: fontSize ?? 14.sp,
              color: clrfont ?? AppColors.black,
              fontStyle: fontStyle ?? FontStyle.normal,
              decoration: textDecoration ?? TextDecoration.none),
    );
  }
}
