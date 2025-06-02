import 'package:credit_yodha/ui/utils/app_colors.dart';
import 'package:credit_yodha/ui/utils/app_string.dart';
import 'package:credit_yodha/ui/utils/common/common_text.dart';
import 'package:credit_yodha/ui/utils/padding_extension.dart';
import 'package:credit_yodha/ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompletProfile extends StatefulWidget {
  const CompletProfile({super.key});

  @override
  State<CompletProfile> createState() => _CompletProfileState();
}

class _CompletProfileState extends State<CompletProfile> {
  TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        title: SvgPicture.asset(
            'assets/svg/app_icon.svg',
                height: 14.h,
          width: 160.w,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 44.h,
          ),
          Row(
            children: [
             RichText(
               text: TextSpan(
                 text: AppString.keyCompleteYourProfile,
                 style: TextStyles.bold.copyWith(fontSize: 20.sp,color: AppColors.black),
                 children: <TextSpan>[
                   TextSpan(
                     text: AppString.keyFillInAllTheProfileDetails,
                     style: TextStyles.regular.copyWith(color: AppColors.clr858585,fontSize: 12.sp),
                   )
                 ]
               ),
             ).paddingOnly(left: 10.w),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          CommonText(
            textAlign: TextAlign.start,
            title: AppString.keyFullName,
            textStyle: TextStyles.bold.copyWith(fontSize: 12.sp,color: AppColors.black),
          ).paddingOnly(left: 15.w),
          TextFormField(
            controller: fullNameController,
            keyboardType: TextInputType.text,
            // maxLength: 10,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Full Name cannot be empty';
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: AppColors.clrE1E1E1)
              ),
              counter: Offstage(),
            ),
          ).paddingAll(20),
          SizedBox(
            height: 20.h,
          ),
          CommonText(title: AppString.keySelectYourGender,
          textStyle: TextStyles.bold.copyWith(color: AppColors.black,fontSize: 12.sp),
          ).paddingOnly(left: 15.w),
          Row(
            children: [
              Container(
                height: 15.h,
                width: 15.h,
                decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.primary, border: Border.all(color: AppColors.clrD8E7FF, width: 2.w)),
              ).paddingOnly(left: 15.w),
              CommonText(title: AppString.keyMale,
              textStyle: TextStyles.regular.copyWith(color: AppColors.clr1C1C1C,fontSize: 13.sp),
              ).paddingOnly(left: 5.w),
              Container(
                height: 15.h,
                width: 15.h,
                decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.white, border: Border.all(color: AppColors.clrDCDCDC)),
              ).paddingOnly(left: 25.w),
            ],
          ),
        ],
      ),
    );
  }
}
