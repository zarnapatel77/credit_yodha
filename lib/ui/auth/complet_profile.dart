import 'package:credit_yodha/ui/auth/helper/complet_profile_conformation_dialog.dart';
import 'package:credit_yodha/ui/auth/terms_and_conditions_screen.dart';
import 'package:credit_yodha/ui/home/home_dashbord.dart';
import 'package:credit_yodha/ui/utils/app_colors.dart';
import 'package:credit_yodha/ui/utils/app_string.dart';
import 'package:credit_yodha/ui/utils/common/common_button.dart';
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
  TextEditingController UsernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    UsernameController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  String selectedGender = AppString.keyMale;
  String selectedIcon = AppString.keyYouCertifyThatTheInformation;
  bool isSleected = false;


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
      body: SingleChildScrollView(
        child: Column(
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
                      style: TextStyles.bold.copyWith(
                          fontSize: 20.sp, color: AppColors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: AppString.keyFillInAllTheProfileDetails,
                          style: TextStyles.regular.copyWith(
                              color: AppColors.clr858585, fontSize: 12.sp),
                        )
                      ]
                  ),
                ).paddingOnly(left: 10.w),
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            CommonText(
              textAlign: TextAlign.start,
              title: AppString.keyFullName,
              textStyle: TextStyles.bold.copyWith(
                  fontSize: 12.sp, color: AppColors.black),
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
            // SizedBox(
            //   height: 5.h,
            // ),
            CommonText(title: AppString.keySelectYourGender,
              textStyle: TextStyles.bold.copyWith(
                  color: AppColors.black, fontSize: 12.sp),
            ).paddingOnly(left: 15.w),
            // Row(
            //   children: [
            //     Container(
            //       height: 15.h,
            //       width: 15.h,
            //       decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.primary, border: Border.all(color: AppColors.clrD8E7FF, width: 2.w)),
            //     ).paddingOnly(left: 15.w),
            //     CommonText(title: AppString.keyMale,
            //     textStyle: TextStyles.regular.copyWith(color: AppColors.clr1C1C1C,fontSize: 13.sp),
            //     ).paddingOnly(left: 5.w),
            //     Container(
            //       height: 15.h,
            //       width: 15.h,
            //       decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.white, border: Border.all(color: AppColors.clrDCDCDC)),
            //     ).paddingOnly(left: 25.w),
            //   ],
            // ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Male';
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 15.h,
                        width: 15.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedGender == 'Male'
                              ? AppColors.primary
                              : AppColors.white,
                          border: Border.all(
                            color: selectedGender == 'Male' ? AppColors
                                .clrD8E7FF : AppColors.clrDCDCDC,
                            width: 2.w,
                          ),
                        ),
                      ).paddingOnly(left: 15.w),
                      CommonText(
                        title: AppString.keyMale,
                        textStyle: TextStyles.regular.copyWith(
                          color: AppColors.clr1C1C1C,
                          fontSize: 13.sp,
                        ),
                      ).paddingOnly(left: 5.w),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Female';
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 15.h,
                        width: 15.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedGender == 'Female'
                              ? AppColors.primary
                              : AppColors.white,
                          border: Border.all(
                            color: selectedGender == 'Female' ? AppColors
                                .clrD8E7FF : AppColors.clrDCDCDC,
                            width: 2.w,
                          ),
                        ),
                      ).paddingOnly(left: 25.w),
                      CommonText(
                        title: AppString.keyFemale,
                        textStyle: TextStyles.regular.copyWith(
                          color: AppColors.clr1C1C1C,
                          fontSize: 13.sp,
                        ),
                      ).paddingOnly(left: 5.w),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Other';
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 15.h,
                        width: 15.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedGender == 'Other'
                              ? AppColors.primary
                              : AppColors.white,
                          border: Border.all(
                            color: selectedGender == 'Other' ? AppColors
                                .clrD8E7FF : AppColors.clrDCDCDC,
                            width: 2.w,
                          ),
                        ),
                      ).paddingOnly(left: 25.w),
                      CommonText(
                        title: AppString.keyOther,
                        textStyle: TextStyles.regular.copyWith(
                          color: AppColors.clr1C1C1C,
                          fontSize: 13.sp,
                        ),
                      ).paddingOnly(left: 5.w),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CommonText(
              textAlign: TextAlign.start,
              title: AppString.keyUsername,
              textStyle: TextStyles.bold.copyWith(
                  fontSize: 12.sp, color: AppColors.black),
            ).paddingOnly(left: 15.w),
            TextFormField(
              controller: UsernameController,
              keyboardType: TextInputType.text,
              // maxLength: 10,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username cannot be empty';
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
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isSleected = !isSleected;
                    });
                  },
                  child: isSleected ?
                  Container(
                    height: 15.h,
                    width: 15.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: selectedIcon ==
                          AppString.keyYouCertifyThatTheInformation ? AppColors
                          .primary : AppColors.primary,
                      border: Border.all(
                        color: selectedIcon ==
                            AppString.keyYouCertifyThatTheInformation
                            ? AppColors.clr357DED
                            : AppColors.primary,
                        width: 1.w,
                      ),
                    ),
                    child: Icon(
                      Icons.done, color: AppColors.white, size: 10.sp,),
                  ).paddingOnly(left: 16.w, right: 16.w) : Container(
                    height: 15.h,
                    width: 15.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(
                        color: AppColors.clr357DED, width: 1.w,
                      ),
                    ),
                  ).paddingOnly(left: 16.w, right: 16.w),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push( context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => TermsAndConditionsScreen(),
                        ),
                      );
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(fontSize: 14.0), // base style
                          children: [
                      TextSpan(
                      text:
                      AppString.keyYouCertifyThatTheInformation,
                      style: TextStyles.regular.copyWith(color: AppColors.clrB5B5B5),
                    ),
                    TextSpan(
                      text: AppString.keyTermsAndConditions,
                      style: TextStyles.bold.copyWith(color: AppColors.primary),
                    ),
                    ],
                                    ),
                        ),
                  ),
                  ),
              ],
            ),
            SizedBox(
              height: 166.5.h,
            ),
            CommonButton(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CompletProfileConformationDialog();
                    },
                  );
                  Future.delayed(const Duration(seconds: 2),() {
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                      return const ImageCarouselApp();
                    }));
                  });
                },
                title:
                AppString.keyVerifyAndProcess
            ).paddingSymmetric(horizontal: 20.w),
          ],
        ),
      ),
    );
  }
}
