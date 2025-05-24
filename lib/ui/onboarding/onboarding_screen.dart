import 'package:credit_yodha/ui/auth/login_screen.dart';
import 'package:credit_yodha/ui/utils/app_colors.dart';
import 'package:credit_yodha/ui/utils/app_string.dart';
import 'package:credit_yodha/ui/utils/common/common_text.dart';
import 'package:credit_yodha/ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  late int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  ///On Skip Button Tapped
  void onSkipButtonTapped(int index) {
    _pageController.jumpToPage(index);
  }

  List<String> onboardingImage = [
    'assets/png/onboarding_1.png',
    'assets/png/onboarding_2.png',
    'assets/png/onboarding_3.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                _pageIndex != 2
                    ? Padding(
                        padding: const EdgeInsets.only(right: 38.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              onSkipButtonTapped(2);
                            },
                            child:
                            CommonText(
                              title: AppString.keySkip,
                              textStyle: TextStyles.regular.copyWith(color: AppColors.clr858585),
                              ),
                            ),
                          ),
                      )
                    : const Offstage(),
                const SizedBox(height: 30),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: PageView.builder(
                    itemCount: onboardingImage.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Center(
                              child: Image.asset(
                                onboardingImage[_pageIndex],
                                width: 335,
                                height: 339,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: RichText(
                                text: TextSpan(
                                    text: _pageIndex == 0
                                        ?AppString.keyGetThe
                                        : _pageIndex == 1
                                            ?AppString.keyGetAnswerToAllYour
                                            :AppString.keyNeverMissOut,
                                    style: _pageIndex == 2
                                        ? TextStyles.bold.copyWith(
                                      color: AppColors.primary,
                                      fontSize: 22.sp,
                                    )

                                        : TextStyles.regular.copyWith(
                                      color: AppColors.black,
                                      fontSize: 22.sp,
                                    ),

                                    children: <TextSpan>[
                                    TextSpan(
                                      text: _pageIndex == 0
                                          ?AppString.keyBESTCreditCard
                                          : _pageIndex == 1
                                          ?AppString.keyCreditCardQuestions
                                          :AppString.keyOnAnyOfferOnYourCreditCard,
                                      style: _pageIndex == 2
                                          ? TextStyles.regular.copyWith(
                                        color: AppColors.black,
                                        fontSize: 22.sp,
                                      )
                                          : TextStyles.bold.copyWith(
                                          color: AppColors.primary, fontSize: 22.sp),
                                    ),

                                      TextSpan(
                                      text: _pageIndex == 0
                                          ?AppString.keyForYOU :'',
                                        style: TextStyles.regular.copyWith(
                                          color: AppColors.black,
                                          fontSize: 22.sp,
                                        ),
                                      ),
                                  ]
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),

                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text( _pageIndex == 0
                                  ?AppString.keyParagraphOnboaring1
                                  : _pageIndex == 1
                                ?AppString.keyParagraphOnboaring2
                              :AppString.keyParagraphOnboaring3,
                                style: TextStyles.regular
                                    .copyWith(color: AppColors.clr858585, fontSize: 14.sp),
                                ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                _pageIndex != 2
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ...List.generate(
                                    _pageIndex != 2 ? 3 : 0,
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: _pageIndex == 2
                                          ? Container()
                                          : Container(
                                              height: 8,
                                              width: 8,
                                              decoration: BoxDecoration(
                                                color: index == _pageIndex
                                                    ? AppColors.primary
                                                    : AppColors.clrC2DAFE,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                            ),
                                    ),
                                  ),
                                  const Spacer(),
                                  if (_pageIndex != 2)
                                    InkWell(
                                      onTap: () {
                                        _pageController.nextPage(
                                          curve: Curves.ease,
                                          duration:
                                              const Duration(microseconds: 300),
                                        );
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonText(
                                  title: AppString.keyGetStart,
                                    textStyle: TextStyles.regular.copyWith(color: AppColors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  color: AppColors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//       ),
//       body:  Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(right: 38.0),
//             child: Align(
//               alignment:Alignment.centerRight,
//               child: Text(
//                 'Skip',
//                 style:  TextStyle(color: AppColors.clr858585,fontSize: 14,),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Expanded(
//             child: PageView.builder(
//               itemCount: 3,
//               controller: _pageController,
//               onPageChanged: (index) {
//                 setState(
//                       () {
//                     _pageIndex = index;
//                   },
//                 );
//               },
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Center(child: Image.asset(onboardingImage[_pageIndex],width: 335,height: 339,)),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 30.0),
//                         child: RichText(
//                           text: const TextSpan(
//                             text: 'Get the ', // Default text
//                             style: TextStyle(color:AppColors.black, fontSize: 22,),
//                             children: <TextSpan>[
//                               TextSpan(
//                                 text: 'BEST Credit Card \n',
//                                 style: TextStyle(color:AppColors.primary,fontWeight: FontWeight.bold),
//                               ),
//                               TextSpan(
//                                 text: ' for YOU!.',
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(left: 30.0),
//                         child: Text(
//                           'Browse & compare 100s of credit cards available in the market. Choose the best suitable credit card for you and increase your savings.',
//                           style: TextStyle(color: AppColors.clr858585,fontSize: 14,),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           const Spacer(),
//           Row(
//             children: [
//               ...List.generate(3, (generator) => Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: Container(
//                   height: 8,
//                   width: 8,
//                   decoration: BoxDecoration(
//                       color: AppColors.primary,
//                       borderRadius: BorderRadius.circular(100)
//
//                   ),
//                 ),
//               ),
//               ),
//               const Spacer(),
//               Container(
//                 height: 50,
//                 width: 50,
//                 child:const Icon(Icons.arrow_forward,color: AppColors.white,),
//                 decoration: BoxDecoration(color: AppColors.primary,borderRadius: BorderRadius.circular(10)),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 46,
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:credit_yodha/ui/utils/app_colors.dart';
// import 'package:flutter/material.dart';
//
// class OnboardingMobile extends StatefulWidget {
//   const OnboardingMobile({super.key});
//
//   @override
//   State<OnboardingMobile> createState() => _OnboardingMobileState();
// }
//
// class _OnboardingMobileState extends State<OnboardingMobile> {
//   late PageController _pageController;
//   late int _pageIndex = 0;
//
//   @override
//   void initState() {
//     _pageController = PageController(initialPage: 0);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   ///On Skip Button Tapped
//   void onSkipButtonTapped(int index) {
//     _pageController.jumpToPage(index);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         itemCount: 3,
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(
//                 () {
//               _pageIndex = index;
//             },
//           );
//         },
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 const Spacer(
//                   flex: 1,
//                 ),
//                 (_pageIndex != 2)
//                     ? Align(
//                   alignment: Alignment.centerRight,
//                   child: InkWell(
//                     onTap: () {
//                       onSkipButtonTapped(2);
//                     },
//                     child: Text(
//                       AppString.keySkip,
//                       style: TextStyles.regular.copyWith(
//                           color: AppColors.colorGrey2, fontSize: 14),
//                     ),
//                   ),
//                 )
//                     : SizedBox(
//                   height: 45,
//                 ),
//                 const Spacer(
//                   flex: 1,
//                 ),
//                 Container(
//                   height: 339,
//                   width: 335,
//                   color: AppColors.colorYellow,
//                 ),
//                 const Spacer(
//                   flex: 1,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                     text: AppString.keyGetThe,
//                     style: TextStyles.regular.copyWith(
//                       color: AppColors.colorBlack,
//                       fontSize: 22,
//                     ),
//                     children: <TextSpan>[
//                       TextSpan(
//                           text: AppString.keyBESTCreditCard,
//                           style: TextStyles(
//                               color: AppColors.colorPrimary, fontSize: 22)),
//                       TextSpan(
//                         text: AppString.keyForYou,
//                         style: TextStyles.regular.copyWith(
//                           color: AppColors.colorBlack,
//                           fontSize: 22,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 Text(
//                   AppString.keyParagraphOnboaring1,
//                   style: TextStyles.regular
//                       .copyWith(color: AppColors.colorGrey2, fontSize: 14),
//                 ),
//                 const Spacer(
//                   flex: 2,
//                 ),
//                 _pageIndex != 2
//                     ? Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ...List.generate(
//                             _pageIndex != 2 ? 3 : 0,
//                                 (index) => Padding(
//                               padding: EdgeInsets.only(right: 8),
//                               child: _pageIndex == 2
//                                   ? Container()
//                                   : DotIndicator(
//                                   isActive: index == _pageIndex),
//                             ),
//                           ),
//                           const Spacer(),
//                           if (_pageIndex != 2)
//                             Align(
//                               alignment: Alignment.centerRight,
//                               child: CommonSmallButton(
//                                 onTap: () {
//                                   _pageController.nextPage(
//                                     curve: Curves.ease,
//                                     duration:
//                                     const Duration(microseconds: 300),
//                                   );
//                                 },
//                                 height: 50,
//                                 width: 50,
//                                 icon: Icons.arrow_forward,
//                                 color: AppColors.primary,
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )
//                     : Row(
//                   children: [
//                     // Expanded(
//                     //   child: CommonButton(
//                     //     onTap: () {
//                     //       print('In common button push method');
//                     //       Navigator.push(
//                     //         context,
//                     //         MaterialPageRoute(
//                     //           builder: (context) => const Login(),
//                     //         ),
//                     //       );
//                     //     },
//                     //     title: AppString.keyGetStarted,
//                     //     textStyle: TextStyles.medium
//                     //         .copyWith(color: AppColors.colorWhite2),
//                     //     color: AppColors.colorPrimary,
//                     //   ),
//                     // ),
//                   ],
//                 ),
//                 const Spacer(
//                   flex: 1,
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

///Small Button
/*SizedBox(
                            height: 50,
                            width: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                _pageIndex == 2
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Splash()),
                                      )
                                    : _pageController.nextPage(
                                        curve: Curves.ease,
                                        duration:
                                            const Duration(microseconds: 300));
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: const Icon(Icons.arrow_forward),
                            ),
                          )*/

///Big Button
/*Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  _pageIndex == 2
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Login()),
                                        )
                                      : _pageController.nextPage(
                                          curve: Curves.ease,
                                          duration: const Duration(
                                              microseconds: 300));
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(AppString.keyGetStarted),
                                    Icon(Icons.arrow_forward)
                                  ],
                                ),
                              ),
                            ),
                          ),*/
