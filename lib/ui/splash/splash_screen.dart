import 'package:credit_yodha/ui/auth/login_screen.dart';
import 'package:credit_yodha/ui/home/home_dashbord.dart';
import 'package:credit_yodha/ui/onboarding/onboarding_screen.dart';
import 'package:credit_yodha/ui/utils/app_assets.dart';
import 'package:credit_yodha/ui/utils/app_string.dart';
import 'package:credit_yodha/ui/utils/common/common_text.dart';
import 'package:credit_yodha/ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ImageCarouselApp()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(
                AppAssets.AppLogo, height: 58.h, width: 140.w
            ),
            const Spacer(),
            const CommonText(
              title: AppString.keyMadeWithLoveInIndia,),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
