import 'package:credit_yodha/ui/auth/helper/common_terms_and_condition_title_widget.dart';
import 'package:credit_yodha/ui/utils/app_assets.dart';
import 'package:credit_yodha/ui/utils/app_colors.dart';
import 'package:credit_yodha/ui/utils/app_string.dart';
import 'package:credit_yodha/ui/utils/common/common_text.dart';
import 'package:credit_yodha/ui/utils/context_extension.dart';
import 'package:credit_yodha/ui/utils/padding_extension.dart';
import 'package:credit_yodha/ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  List<TermsAndConditionsModel> termsAndConditionsList = [
    TermsAndConditionsModel(
        title: 'Use Of The App',
        subtitle:
            'the app provides a platform for comparing credit cards and related services. you may use the app for personal, non- commercial purposes only. you agree not to use the app for any illegal or unauthorized activities or in a manner that violates any applicable laws or regulations.'),
    TermsAndConditionsModel(
        title: 'Intellectual Property Rights',
        subtitle:
            'all intellectual property rights, including trademarks, copyrights, and any other proprietary rights, in the app and its content belong to the apps owners. you are granted a limited, non-exclusive, and non-transferable license to use the app solely for its intended purposes. you must not copy, modify, distribute, sell, or exploit any part of the app without prior written permission.'),
    TermsAndConditionsModel(
        title: 'Accuracy Of Information',
        subtitle:
            'while we strive to provide accurate and up-to-date information, the apps content may contain errors, inaccuracies, or outdated information. we do not guarantee the completeness, reliability, or accuracy of any information presented on the app. you acknowledge that any reliance on such information is at your own risk.'),
    TermsAndConditionsModel(
        title: 'Third-Party Content And Links',
        subtitle:
            'the app may include content provided by third parties and links to external websites or services. we do not endorse, control, or assume any responsibility for the accuracy, legality, or availability of third-party content or websites. your interactions with third-party content or websites are solely between you and the respective third party.'),
  ];

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMM yyyy').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        title: CommonText(
          title: AppString.keyTermsAndConditions,
          textStyle: TextStyles.regular.copyWith(fontSize: 16.sp),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            SvgPicture.asset(
              AppAssets.AppIcon,
              height: 14.1.h,
              width: context.width * 0.2,
            ).paddingOnly(left: 20.w),
          ]),
          SizedBox(
            height: 11.h,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                    text: AppString.keyLastUpdated,
                    style: TextStyles.regular
                        .copyWith(color: AppColors.clrB5B5B5, fontSize: 14.sp),
                    children: [
                      TextSpan(
                          text: formattedDate,
                          style: TextStyles.regular
                              .copyWith(color: AppColors.black)),
                    ]),
              ).paddingOnly(left: 20.w)
            ],
          ),
          SizedBox(
            height: 11.h,
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: termsAndConditionsList.length,
              itemBuilder: (BuildContext context, int index) {
                return CommonTermsAndConditionTitleWidget(
                  title: termsAndConditionsList[index].title,
                  subtitle: termsAndConditionsList[index].subtitle,
                );
              }, separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20.h);
            },
            ).paddingSymmetric(horizontal: 20, vertical: 10),
          )
        ],
      ),
    );
  }
}

class TermsAndConditionsModel {
  final String title;
  final String subtitle;

  TermsAndConditionsModel({required this.title, required this.subtitle});
}
