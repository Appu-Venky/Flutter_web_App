import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_two/contants/constants.dart';
import 'package:project_two/model/clinet_say_model.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentIndex < message.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      if (mounted) {
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'What Our Clients Say 💬',
            style: AppTextStyles.headlineMedium(context)?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 20),
          // Ensure the PageView gets proper height dynamically
          SizedBox(
            height: 400, // Adjust height dynamically
            child: PageView.builder(
              controller: _pageController,
              itemCount: message.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _currentIndex == index ? 1.0 : 0.5,
                  child: FeatureCard(message: message[index]),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          _buildDotIndicator(),
        ],
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        message.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 8,
          width: _currentIndex == index ? 24 : 10,
          decoration: BoxDecoration(
            color: _currentIndex == index
                ? Colors.blueGrey[700]
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final ClinetSayModel message;

  const FeatureCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 250),
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueGrey[700],
            borderRadius: BorderRadius.circular(2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.format_quote_rounded,
                      size: 35, color: Colors.white54)),
              const SizedBox(height: 10),
              // Wrapping text inside Flexible to prevent overflow
              Flexible(
                child: Text(
                  message.testimonialText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.format_quote_rounded,
                      size: 35, color: Colors.white54)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(message.profile),
            ),
            const SizedBox(height: 10),
            Text(
              message.clinetName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Verified Client",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
