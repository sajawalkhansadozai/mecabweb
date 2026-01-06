import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Gold Theme (for accents only)
  static const Color goldPrimary = Color(0xFFD4AF37);
  static const Color goldLight = Color(0xFFFFD700);
  static const Color goldDark = Color(0xFFB8860B);
  static const Color gold900 = Color(0xFF9B7A00);
  static const Color goldVeryLight = Color(0xFFFFE55C);

  // Background Colors - Mostly Black
  static const Color bgBlack = Color(0xFF000000);
  static const Color bgGray50 = Color(0xFF0A0A0A);
  static const Color bgGray100 = Color(0xFF141414);
  static const Color bgLight = Color(0xFF0A0A0A);

  // Text Colors
  static const Color textDark = Color(0xFFFFFFFF);
  static const Color textGray700 = Color(0xFFE5E5E5);
  static const Color textGray600 = Color(0xFFCCCCCC);
  static const Color textGray400 = Color(0xFF999999);

  // Border Colors
  static const Color borderGray200 = Color(0xFF222222);
  static const Color borderGold100 = Color(0xFFD4AF37);

  // Gradient Colors
  static LinearGradient get greenGradient => const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF000000), Color(0xFF1A1A1A)],
  );

  static LinearGradient get heroGradient => const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF000000), Color(0xFF0A0A0A), Color(0xFF000000)],
  );

  static LinearGradient get cardGradient => const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0A0A0A), Color(0xFF141414)],
  );

  static LinearGradient get softGreenGradient => const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF000000), Color(0xFF0A0A0A)],
  );

  static LinearGradient get glowGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      goldPrimary.withValues(alpha: 0.05),
      goldLight.withValues(alpha: 0.02),
    ],
  );
}
