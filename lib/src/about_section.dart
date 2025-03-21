import 'package:flutter/material.dart';
import '../contants/constants.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About Us',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primary),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "We are a leading company providing top-notch solutions for businesses. "
                  "Our mission is to deliver high-quality products with exceptional user experiences.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: AppColors.textPrimary),
                ),
              ),
              const SizedBox(width: 20),
              Image.asset("assets/images/about_us.png", height: 200),
            ],
          ),
        ],
      ),
    );
  }
}
