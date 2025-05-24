import 'package:credit_yodha/ui/auth/otp_verificationscreen.dart';
import 'package:credit_yodha/ui/utils/app_colors.dart';
import 'package:credit_yodha/ui/utils/app_string.dart';
import 'package:credit_yodha/ui/utils/common/common_text.dart';
import 'package:credit_yodha/ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    mobileNumberController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 124.h),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/svg/app_logo.svg',
                  width: 121.6.w,
                  height: 50.27.h,
                ),
                SizedBox(height: 4.56.h),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 65.0.w),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 15.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.primary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CommonText(
                        title: '.com',
                        fontSize: 9.sp,
                        clrfont: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 100.03.h),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonText(
                    title: AppString.keySingleClickSignIn,
                    textStyle: TextStyles.bold.copyWith(fontSize: 20.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: AppString.keyParagraphLoginScreen,
                      style: TextStyles.regular.copyWith(
                        color: AppColors.clr858585,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 42.25.h),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: Row(
                children: [
                  CommonText(
                    title: AppString.keyEnterMobileNumber,
                    textStyle: TextStyles.bold.copyWith(
                      color: AppColors.black,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.25.h),

            // ✅ Mobile Number Form Field with Validation
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.white,
                  ),
                  child: TextFormField(
                    controller: mobileNumberController,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mobile number cannot be empty';
                      } else if (value.length != 10) {
                        return 'Mobile number must be exactly 10 digits';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        margin: EdgeInsets.only(right: 8.w, top: 8.h, bottom: 8.h),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: AppColors.clr858585),
                          ),
                        ),
                        constraints: BoxConstraints(maxWidth: 35.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CommonText(
                            title: AppString.keyIndiaCountryCode,
                            textStyle: TextStyles.regular.copyWith(
                              color: AppColors.clr858585,
                            ),
                          ),
                        ),
                      ),
                      border: InputBorder.none,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: mobileNumberController.text.length == 10
                            ? SvgPicture.asset(
                          'assets/svg/tick_icon.svg',
                          width: 5.h,
                          height: 5.h,
                        )
                            : const Offstage(),
                      ),
                      counter: const Offstage(),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 25.5.h),

            // ✅ OTP Button with Validation
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => OtpVerificationScreen(
                        mobileNumber: mobileNumberController.text,
                      ),
                    ),
                  );
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: CommonText(
                      title: AppString.keyGetOTP,
                      textStyle: TextStyles.regular.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 24.h),

            // Divider and Google Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(color: AppColors.clr858585),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                    child: CommonText(
                      title: AppString.keyOR,
                      textStyle: TextStyles.regular.copyWith(
                        color: AppColors.clr858585,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: AppColors.clr858585),
                  ),
                ],
              ),
            ),
            SizedBox(height: 21.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      side: BorderSide(
                        color: AppColors.clr858585,
                        width: 0.5.w,
                      ),
                    ),
                  ),
                ),
                child: SizedBox(
                  height: 50.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0.w),
                        child: Center(
                          child: Image.asset(
                            'assets/png/google_logo.png',
                            width: 20.87.w,
                            height: 21.29.h,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 8.0.w, top: 8.0.h, bottom: 8.0.h),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: AppColors.clr858585),
                          ),
                        ),
                      ),
                      const Spacer(flex: 4),
                      CommonText(
                        title: AppString.keySignInWithGoogle,
                        textStyle: TextStyles.regular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      const Spacer(flex: 4),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 100.h),

            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: AppString.keyByContinuing,
                  style: TextStyles.regular.copyWith(
                    color: Colors.black,
                    fontSize: 10.sp,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: AppString.keyPrivacyPolicy,
                      style: TextStyles.regular.copyWith(
                        color: Colors.blue,
                        fontSize: 10.sp,
                      ),
                    ),
                    TextSpan(
                      text: AppString.keyAnd,
                      style: TextStyles.regular.copyWith(fontSize: 10.sp),
                    ),
                    TextSpan(
                      text: AppString.keyTermsCondition,
                      style: TextStyles.regular.copyWith(
                        color: Colors.blue,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
