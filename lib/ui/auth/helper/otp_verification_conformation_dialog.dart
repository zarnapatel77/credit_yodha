import 'package:credit_yodha/ui/utils/app_colors.dart';
import 'package:credit_yodha/ui/utils/app_string.dart';
import 'package:credit_yodha/ui/utils/common/common_text.dart';
import 'package:credit_yodha/ui/utils/padding_extension.dart';
import 'package:credit_yodha/ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpVerificationConformationDialog extends StatelessWidget {
  const OtpVerificationConformationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 276.h,
              width: 250.w,
              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 80.h,
                    width: 80.h,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.primary,),
                    child: Icon(Icons.done,size: 50.sp,color: AppColors.white,),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                      text: TextSpan(
                          text: AppString.keyYourOTPVerificationIsComplete,
                          style: TextStyles.regular.copyWith(color: AppColors.primary,fontSize: 14.sp,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: AppString.keyOTPVerificationParagraph,
                            style: TextStyles.regular.copyWith(color: AppColors.clr1C1C1C,fontSize: 10.sp),
                          ),
                        ]
                      ),
                  ).paddingAll(21),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
