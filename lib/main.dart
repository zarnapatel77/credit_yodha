import 'package:credit_yodha/ui/splash/splash_screen.dart';
import 'package:credit_yodha/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(312, 875),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Credit Yodha',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
            ColorScheme.fromSeed(seedColor: AppColors.primary),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
