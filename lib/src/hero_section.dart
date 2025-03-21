import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:project_two/contants/constants.dart';

class HeroSection extends StatelessWidget {
  final double scrollPosition;

  const HeroSection({super.key, required this.scrollPosition});

  @override
  Widget build(BuildContext context) {
    return // In HeroSection widget
        LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return Container(
          height: isMobile ? 800 : MediaQuery.of(context).size.height,
          child:
              isMobile ? _buildMobileHero(context) : _buildDesktopHero(context),
        );
      },
    );
  }

  Widget _buildDesktopHero(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(gradient: Gradients.primaryGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Transform Your Digital Presence',
                        style: AppTextStyles.headlineLarge(context)
                            .copyWith(color: Colors.white)),
                    const SizedBox(height: 20),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'Create stunning web experiences',
                          textStyle: TextStyle(
                            fontSize: 24,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                      ),
                      onPressed: () {},
                      child: const Text('Get Started',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ).animate().slideX(duration: 500.ms),
              ),
              Expanded(
                child: Image.asset('assets/images/banner.png')
                    .animate()
                    .scale(delay: 300.ms),
              ),
            ],
          ),
        ),
      ); // Original desktop layout
  Widget _buildMobileHero(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(gradient: Gradients.primaryGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Transform Your Digital Presence',
                        style: AppTextStyles.headlineLarge(context)
                            .copyWith(color: Colors.white)),
                    const SizedBox(height: 20),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'Create stunning web experiences',
                          textStyle: TextStyle(
                            fontSize: 24,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                      ),
                      onPressed: () {},
                      child: const Text('Get Started',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ).animate().slideX(duration: 500.ms),
              ),
              Expanded(
                child: Image.asset('assets/images/hero-image.png')
                    .animate()
                    .scale(delay: 300.ms),
              ),
            ],
          ),
        ),
      ); // Stacked mobile layout
}
