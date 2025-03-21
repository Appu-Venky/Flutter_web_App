import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_two/contants/constants.dart';
import 'package:project_two/src/features_section.dart';
import 'package:project_two/src/hero_section.dart';
import 'package:project_two/src/testimonials.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import 'src/Header.dart';
import 'src/footer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          background: AppColors.background,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _maxScrollExtent = 0;

  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _testimonialsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollPosition);
  }

  void _updateScrollPosition() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
      _maxScrollExtent = _scrollController.position.maxScrollExtent;
    });
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebSmoothScroll(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(scrollPosition: _scrollPosition),
                  FeaturesSection(key: _featuresKey)
                      .animate()
                      .fadeIn(delay: 300.ms),
                  TestimonialsSection(key: _testimonialsKey)
                      .animate()
                      .fadeIn(delay: 300.ms),
                  FooterSection(key: _contactKey),
                ],
              ),
            ),
          ),
          Header(
            scrollPosition: _scrollPosition,
            onHomePressed: () => _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
            onAboutPressed: () => _scrollToSection(_testimonialsKey),
            onFeaturesPressed: () => _scrollToSection(_featuresKey),
            onContactPressed: () => _scrollToSection(_contactKey),
          ),
          // Scroll Indicator
          Positioned(
            right: 20,
            top: MediaQuery.of(context).size.height / 2 - 75,
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_upward),
                  onPressed: () => _scrollController.animateTo(
                    _scrollController.offset - 500,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  ),
                ),
                Container(
                  height: 150,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: _maxScrollExtent > 0
                            ? (_scrollPosition / _maxScrollExtent) * 130
                            : 0,
                        child: Container(
                          width: 2,
                          height: 20,
                          color: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  onPressed: () => _scrollController.animateTo(
                    _scrollController.offset + 500,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
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
