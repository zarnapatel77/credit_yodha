import 'package:credit_yodha/ui/utils/app_assets.dart';
import 'package:credit_yodha/ui/utils/app_colors.dart';
import 'package:credit_yodha/ui/utils/app_string.dart';
import 'package:credit_yodha/ui/utils/common/common_text.dart';
import 'package:credit_yodha/ui/utils/context_extension.dart';
import 'package:credit_yodha/ui/utils/padding_extension.dart';
import 'package:credit_yodha/ui/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class ImageCarouselApp extends StatefulWidget {
  const ImageCarouselApp({super.key});

  @override
  State<ImageCarouselApp> createState() => _ImageCarouselAppState();
}

class _ImageCarouselAppState extends State<ImageCarouselApp> {
  final List<String> imageUrls = [
    AppAssets.Onboarding1,
    AppAssets.Onboarding2,
    AppAssets.Onboarding3,
  ];

  final List<BankIcons> bankIconList = [
    BankIcons(bankIcon: AppAssets.HDFClogo, bankName: AppString.keyHDFCBank),
    BankIcons(bankIcon: AppAssets.Axislogo, bankName: AppString.keyAxisBank),
    BankIcons(bankIcon: AppAssets.IDBIlogo, bankName: AppString.keyIDBIBank),
    BankIcons(bankIcon: AppAssets.SBIlogo, bankName: AppString.keySBIBank),
    BankIcons(bankIcon: AppAssets.Kotaklogo, bankName: AppString.keyKotakBank),
  ];

  final List<BankIcons> utilitesIconList = [
    BankIcons(bankIcon: AppAssets.PlaneIcon, bankName: AppString.keyTravel),
    BankIcons(bankIcon: AppAssets.FuelIcon, bankName: AppString.keyFuel),
    BankIcons(bankIcon: AppAssets.SecureIcon, bankName: AppString.keySecurePay),
    BankIcons(bankIcon: AppAssets.ShoppingIcon, bankName: AppString.keyShopping),
    BankIcons(bankIcon: AppAssets.BusinessIcon, bankName: AppString.keyBusiness),
    BankIcons(bankIcon: AppAssets.StudentIcon, bankName: AppString.keyStudent),
    BankIcons(bankIcon: AppAssets.CashbackIcon, bankName: AppString.keyCashback),
    BankIcons(bankIcon: AppAssets.MoreIcon, bankName: AppString.keyMore),
  ];



  final CarouselController _carouselController = CarouselController();

  int _currentPage = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list_outlined),
        title: SvgPicture.asset(
          AppAssets.AppIcon,
          height: 14.h,
          width: 160.w,
        ).paddingOnly(left: 83.h,right: 84.h),
        actions: const [
          Icon(Icons.notifications_outlined)
        ],
      ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CupertinoSearchTextField(
                prefixIcon: Icon(Icons.search_outlined),
                backgroundColor: AppColors.white,
              ).paddingAll(20),

              CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: imageUrls.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0), // Smaller padding for carousel items
                    child: ClipRRect( // ClipRRect for rounded corners on images
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        height: 150,
                        imageUrls[index],
                        fit: BoxFit.cover, // Cover the entire area of the image container
                        width: double.infinity, // Make image take full width
                        errorBuilder: (context, error, stackTrace) {
                          // Fallback for image loading errors
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 50,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 150.0, // Fixed height for the carousel
                  autoPlay: true, // Enable auto-play
                  enlargeCenterPage: true, // Enlarge the current page
                  aspectRatio: 16 / 9, // Aspect ratio of the carousel
                  viewportFraction: 0.8, // Fraction of the viewport occupied by each item
                  onPageChanged: (index, reason) {
                    // Update _currentPage when the carousel page changes
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20), // Spacer below the carousel

              // Row for the pagination indicator dots.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageUrls.asMap().entries.map((entry) {
                  int index = entry.key;
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the tapped page when a dot is tapped using CarouselController.
                      _carouselController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150), // Animation for dot size/color change
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      height: 8.0,
                      width: _currentPage == index ? 24.0 : 8.0, // Highlight current page dot
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.blue // Active dot color
                            : Colors.grey, // Inactive dot color
                        borderRadius: BorderRadius.circular(4.0), // Rounded dots
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  CommonText(
                    textAlign: TextAlign.left,
                    title: AppString.keyBank,
                    textStyle: TextStyles.bold.copyWith(
                        fontSize: 16.sp, color: AppColors.black),
                  ).paddingOnly(left: 20.w),
                  const Spacer(
                    flex: 1,
                  ),
                  CommonText(
                    textAlign: TextAlign.right,
                    title: AppString.keyViewAll,
                    textStyle: TextStyles.bold.copyWith(
                        fontSize: 14.sp, color: AppColors.primary),
                  ).paddingOnly(right: 20.w),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: context.height * 0.12,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: bankIconList.length,
                  itemBuilder: (BuildContext context, int index) {
                    BankIcons items = bankIconList[index];
                    return Row(
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              items.bankIcon,
                              width: 48.w,
                              height: 48.h,
                            ).paddingOnly(bottom: 10.h),
                            CommonText(title: items.bankName,
                            textStyle: TextStyles.regular.copyWith(fontSize: 9.sp),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10.w,);
                  },
                ),
              ),
              Image.asset(
                  AppAssets.HomeBanner,
                width: context.width,
              ),
              Row(
                children: [
                  CommonText(
                    textAlign: TextAlign.left,
                    title: AppString.keyUtilities,
                    textStyle: TextStyles.bold.copyWith(
                        fontSize: 14.sp, color: AppColors.black),
                  ).paddingOnly(left: 20.w),
                  const Spacer(
                    flex: 1,
                  ),
                  CommonText(
                    textAlign: TextAlign.right,
                    title: AppString.keyViewAllCards,
                    textStyle: TextStyles.bold.copyWith(
                        fontSize: 12.sp, color: AppColors.primary),
                  ).paddingOnly(right: 20.w),
                ],
              ),

              SizedBox(
                height: context.height * 0.4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.white
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                     itemCount: utilitesIconList.length,
                     itemBuilder: (BuildContext context, int index) {
                    BankIcons items = utilitesIconList[index];
                    return Row(
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              items.bankIcon,
                              width: 48.w,
                              height: 48.h,
                            ).paddingOnly(bottom: 10.h),
                            CommonText(title: items.bankName,
                              textStyle: TextStyles.regular.copyWith(fontSize: 9.sp),
                            ),
                          ],
                        ),
                      ],
                    );
                  },),
                ),
              )
            ],
          ),
        ),
    );
  }
}

class BankIcons{
  final String bankIcon;
  final String bankName;
  BankIcons({required this.bankIcon, required this.bankName});
}
