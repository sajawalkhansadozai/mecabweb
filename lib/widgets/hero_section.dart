import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;
    final isMobile = screenWidth <= 600;

    return Container(
      width: double.infinity,
      height: isMobile ? 500 : 600,
      decoration: BoxDecoration(gradient: AppColors.heroGradient),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : (isTablet ? 32 : 48),
          vertical: isMobile ? 60 : (isTablet ? 80 : 100),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Heading with highlighted text
            RichText(
              text: TextSpan(
                style: AppTextStyles.h1.copyWith(
                  fontSize: isMobile ? 40 : (isTablet ? 52 : 64),
                  color: Colors.white,
                  height: 1.2,
                ),
                children: [
                  const TextSpan(text: 'Luxury '),
                  TextSpan(
                    text: 'Electric Rides\n',
                    style: TextStyle(
                      backgroundColor: AppColors.goldPrimary,
                      color: Colors.white,
                    ),
                  ),
                  const TextSpan(text: 'for '),
                  TextSpan(
                    text: 'Pakistan',
                    style: TextStyle(color: AppColors.gold900),
                  ),
                ],
              ),
            ),
            SizedBox(height: isMobile ? 20 : 28),

            // Subtitle
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 0),
                child: Text(
                  'Experience luxury, comfort, and eco-friendly travel with Mecab - Pakistan\'s first luxury electric taxi service',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: Colors.white,
                    fontSize: isMobile ? 16 : 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: isMobile ? 24 : 32),

            // Buttons
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                _HeroButton(
                  text: 'Download App',
                  isPrimary: true,
                  onPressed: () {},
                ),
                _HeroButton(
                  text: 'Learn More',
                  isPrimary: false,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroButton extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback onPressed;

  const _HeroButton({
    required this.text,
    required this.isPrimary,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 600;

    return Container(
      decoration: BoxDecoration(
        color: isPrimary ? AppColors.goldPrimary : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 28,
            vertical: isMobile ? 12 : 16,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: AppTextStyles.buttonLarge.copyWith(
            color: isPrimary ? Colors.white : AppColors.goldPrimary,
            fontSize: isMobile ? 14 : 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
