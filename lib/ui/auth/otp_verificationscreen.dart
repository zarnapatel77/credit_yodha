import 'dart:async';

import 'package:credit_yodha/ui/auth/complet_profile.dart';
import 'package:credit_yodha/ui/auth/helper/otp_verification_conformation_dialog.dart';
import 'package:credit_yodha/ui/utils/app_assets.dart';
import 'package:credit_yodha/ui/utils/app_colors.dart';
import 'package:credit_yodha/ui/utils/app_string.dart';
import 'package:credit_yodha/ui/utils/common/common_button.dart';
import 'package:credit_yodha/ui/utils/common/common_text.dart';
import 'package:credit_yodha/ui/utils/context_extension.dart';
import 'package:credit_yodha/ui/utils/padding_extension.dart';
import 'package:credit_yodha/ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String mobileNumber;

  const OtpVerificationScreen({super.key, required this.mobileNumber});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  int _seconds = 60;
  Timer? _timer;

  String maskMobileNumber(String number) {
    if (number.length != 10) return number;
    return '${number.substring(0, 2)}XXXX${number.substring(6)}';
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
        title: CommonText(
          title: AppString.keyVerification,
          textStyle: TextStyles.regular.copyWith(fontSize: 16.sp),
        ),
      ),
      body: Column(
        children: [
          Center(
              child:
              Lottie.asset(AppAssets.otpLottie, height: context.height * 0.088, width: context.height * 0.088)
          ),
          SizedBox(
            height: 42.h,
          ),
          CommonText(
            title: AppString.keyEnterOTPHere,
            textStyle: TextStyles.bold.copyWith(fontSize: 16.sp, color: AppColors.primary),
          ),

          Wrap(
            children: [
              const CommonText(title: AppString.keyWeHaveSentOnOTPTo),
              CommonText(
                title: '+91 ${maskMobileNumber(widget.mobileNumber)}',
                textStyle: TextStyles.bold,
              ),
              const CommonText(
                title: AppString.keyViaSMS,
              ),
            ],
          ),

          /// OTP Fields
          PinCodeTextField(
            length: 6,
            obscureText: false,
            keyboardType: TextInputType.number,
            animationType: AnimationType.scale,
            hintCharacter: '0',
            hintStyle: TextStyles.regular.copyWith(color: AppColors.clrD8D8D8, fontSize: 26.sp),
            pinTheme: PinTheme(
              fieldHeight: 55.h,
              fieldWidth: 40.w,
              activeFillColor: Colors.transparent,
              disabledColor: Colors.transparent,
              selectedColor: Colors.transparent,
              selectedFillColor: Colors.transparent,
              inactiveFillColor: Colors.transparent,
              inactiveColor: Colors.transparent,
              activeColor: Colors.transparent,
            ),
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Colors.transparent,
            enableActiveFill: true,
            errorAnimationController: errorController,
            controller: textEditingController,
            onCompleted: (v) {},
            onChanged: (value) {
              setState(
                () {
                  currentText = value;
                },
              );
            },
            beforeTextPaste: (text) {
              return true;
            },
            appContext: context,
          ),

          /// Countdown Timer
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                title: AppString.keyRequestNewOTP,
                textStyle: TextStyles.regular.copyWith(fontSize: 12.sp),
              ).paddingOnly(right: 5.w),
              if (_seconds != 0) ...{
                CommonText(
                  title: _seconds < 10 ? '00:0${_seconds.toString()}' : '00:${_seconds.toString()}',
                  textStyle: TextStyles.regular.copyWith(fontSize: 12.sp, color: AppColors.clrFF4B4B),
                ),
              } else ...{
                /// Resend OTP Button
                InkWell(
                  onTap: () {
                    _timer?.cancel();
                    setState(() {
                      _seconds = 60;
                      startTimer();
                    });
                  },
                  child: CommonText(
                    title: AppString.keyResendOTP,
                    textStyle: TextStyles.regular.copyWith(fontSize: 12.sp, color: AppColors.primary),
                  ),
                ),
              }
            ],
          ),
          const Spacer(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       height: 50.h,
          //       width: 250.w,
          //       decoration: BoxDecoration(color: AppColors.primary,borderRadius: BorderRadius.circular(10)),
          //       child: CommonText(
          //         textAlign: TextAlign.center,
          //           title: AppString.keyVerifyAndProcess,
          //         textStyle: TextStyles.regular.copyWith(color: AppColors.white),
          //       ),
          //     ),
          //   ],
          // )
          CommonButton(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const OtpVerificationConformationDialog();
                  },
                );
                Future.delayed(const Duration(seconds: 2),() {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return const CompletProfile();
                  }));
                });

              },
          title:
            AppString.keyVerifyAndProcess
          ),
        ],
      ).paddingAll(20.w),
    );
  }
}
