import 'package:expenz/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:expenz/constants/constants.dart';  

class SharedOnboardingScreen extends StatelessWidget {

  final String title;
  final String imagePath;
  final String description;
  const SharedOnboardingScreen({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 300,
          ),
          const SizedBox(
            height: 20,
          ),
           Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
        
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color:kGrey,
            ),
          ),
        ],
         
      ),
    );
  }
}