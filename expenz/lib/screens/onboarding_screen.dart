import 'package:expenz/constants/colors.dart';
import 'package:expenz/screens/user_data_screen.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:expenz/data/onboarding_data.dart';
import 'package:expenz/screens/onboarding/front_page.dart';
import 'package:expenz/screens/onboarding/shared_onboarding_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool showDetailsPage = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      int currentPage = _controller.page?.round() ?? 0;
      setState(() {
        showDetailsPage = currentPage == 3;
        print(showDetailsPage);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Onboarding pages
                PageView(
                  controller: _controller,
                  children: [
                    FrontPage(),

                    SharedOnboardingScreen(
                      title: OnboardingData.onboardingDataList[0].title,
                      imagePath: OnboardingData.onboardingDataList[0].imagePath,
                      description:
                          OnboardingData.onboardingDataList[0].description,
                    ),

                    SharedOnboardingScreen(
                      title: OnboardingData.onboardingDataList[1].title,
                      imagePath: OnboardingData.onboardingDataList[1].imagePath,
                      description:
                          OnboardingData.onboardingDataList[1].description,
                    ),

                    SharedOnboardingScreen(
                      title: OnboardingData.onboardingDataList[2].title,
                      imagePath: OnboardingData.onboardingDataList[2].imagePath,
                      description:
                          OnboardingData.onboardingDataList[2].description,
                    ),
                  ],
                ),

                // Page dot indicators
                Container(
                  alignment: Alignment(0, 0.75),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),
                  ),
                ),

                // Navigation button
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child:  !showDetailsPage ? GestureDetector(
                      onTap: () {
                        if (_controller.page == 3) {
                          // You can navigate to another screen here, like a login or home screen
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: CustomButton(
                        buttonName: showDetailsPage ? "Get Started" : "Next",
                        buttonColor: kMainColor,
                      ),
                    )
                    :GestureDetector(
                      onTap: () {
                        // Navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserDataScreen(),
                          ),
                        );
                       
                      },
                      child: CustomButton(
                        buttonName: showDetailsPage ? "Get Started" : "Next",
                        buttonColor: kMainColor,
                      ),
                    ),


                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
