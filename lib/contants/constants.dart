import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF2A2D3E);
  static const Color secondary = Color(0xFFFCA311);
  static const Color background = Color(0xFFFAFAFA);
  static const Color textPrimary = Color(0xFF2A2D3E);
  static const Color textSecondary = Color(0xFF6C757D);
}

class Gradients {
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2A2D3E), Color(0xFF3C4166)],
  );
}

class AppTextStyles {
  static TextStyle headlineLarge(BuildContext context) => 
    GoogleFonts.poppins(fontSize: 48, fontWeight: FontWeight.w700);
  
  static TextStyle headlineMedium(BuildContext context) => 
    GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w600);
}