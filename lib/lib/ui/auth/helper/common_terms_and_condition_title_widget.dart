import 'package:credit_yodha/ui/utils/common/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTermsAndConditionTitleWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const CommonTermsAndConditionTitleWidget({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(title: title??'', fontWeight: FontWeight.w600,),
        SizedBox(
          height: 10.h,
        ),
        CommonText(title: subtitle??'', maxLines: 10,),
      ],
    );
  }
}
