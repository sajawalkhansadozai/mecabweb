import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class SafetyHighlightSection extends StatelessWidget {
  const SafetyHighlightSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 900;

    return Container(
      width: double.infinity,
      color: AppColors.bgGray50,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 48,
        vertical: isMobile ? 60 : 80,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: isMobile
            ? Column(
                children: [
                  _buildContent(isMobile),
                  const SizedBox(height: 32),
                  _buildImageSection(isMobile),
                ],
              )
            : Row(
                children: [
                  Expanded(child: _buildImageSection(isMobile)),
                  const SizedBox(width: 60),
                  Expanded(child: _buildContent(isMobile)),
                ],
              ),
      ),
    );
  }

  Widget _buildImageSection(bool isMobile) {
    return Container(
      width: double.infinity,
      height: isMobile ? 300 : 500,
      decoration: BoxDecoration(
        gradient: AppColors.greenGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Icon(
          Icons.shield_outlined,
          size: isMobile ? 120 : 180,
          color: Colors.white.withValues(alpha: 0.9),
        ),
      ),
    );
  }

  Widget _buildContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.goldPrimary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Safety',
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.bgBlack,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 20 : 28),

        // Heading
        Text(
          'Your safety is our priority',
          style: AppTextStyles.h2.copyWith(
            fontSize: isMobile ? 32 : 48,
            height: 1.1,
          ),
        ),
        SizedBox(height: isMobile ? 16 : 24),

        // Bold subheading
        Text(
          'Safety is non-negotiable.',
          style: AppTextStyles.h3.copyWith(
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: isMobile ? 12 : 16),

        // Description
        Text(
          'We put our full effort into making every ride with Mecab safe - for everyone, every time - because your safety is our top priority.',
          style: AppTextStyles.bodyLarge.copyWith(
            fontSize: isMobile ? 16 : 18,
            color: AppColors.textGray700,
            height: 1.6,
          ),
        ),
        SizedBox(height: isMobile ? 24 : 32),

        // CTA Button
        Container(
          decoration: BoxDecoration(
            color: AppColors.goldPrimary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 32,
                vertical: isMobile ? 14 : 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Learn more',
              style: AppTextStyles.button.copyWith(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w600,
                color: AppColors.bgBlack,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
