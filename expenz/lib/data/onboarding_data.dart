import 'package:expenz/models/onboarding_model.dart';

class OnboardingData {
  static final List<Onboarding> onboardingDataList = [
    Onboarding(
      imagePath: "assets/images/onboard_1.png",
      title: "Gain total control of your money",
      description: "Become your own money manager and make every cent count",
    ),
    Onboarding(
      imagePath: "assets/images/onboard_2.png",
      title: "Know where your money goes",
      description: "Track your transactions easily, with categories and financial reports",
    ),
    Onboarding(
      imagePath: "assets/images/onboard_3.png",
      title: "Planning ahead",
      description: "Setup your budget for each category",
    ),
  ];
}