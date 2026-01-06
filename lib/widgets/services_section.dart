import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      width: double.infinity,
      color: AppColors.bgGray50,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 60 : 80,
      ),
      child: Column(
        children: [
          // Small badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.goldPrimary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Mecab app',
              style: AppTextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.bgBlack,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 16 : 20),

          // Section Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 0),
            child: Text(
              'One app, many services',
              style: AppTextStyles.h2.copyWith(fontSize: isMobile ? 32 : 48),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: isMobile ? 40 : 64),

          // Services Grid
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 32,
                runSpacing: 32,
                alignment: WrapAlignment.center,
                children: const [
                  _ServiceCard(
                    title: 'City Rides',
                    description: 'Forever good rides for a fair price',
                    features: ['For Passengers', 'For Drivers'],
                  ),
                  _ServiceCard(
                    title: 'City to City',
                    description:
                        'Choose comfort at fair price all the way long',
                    features: ['For Passengers', 'For Drivers'],
                  ),
                  _ServiceCard(
                    title: 'Airport Transfer',
                    description: 'Premium airport pickup and drop-off services',
                    features: ['For Passengers', 'For Drivers'],
                  ),
                  _ServiceCard(
                    title: 'Corporate Travel',
                    description:
                        'Reliable transportation for business professionals',
                    features: ['For Business', 'For Employees'],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> features;

  const _ServiceCard({
    required this.title,
    required this.description,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      width: isMobile ? screenWidth - 32 : 400,
      constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 450),
      padding: EdgeInsets.all(isMobile ? 24 : 32),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderGold100, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: AppTextStyles.h3.copyWith(
              color: AppColors.goldPrimary,
              fontSize: isMobile ? 20 : 24,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),

          // Description
          Text(
            description,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textGray700,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),

          // Features List
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text(
                    '✓ ',
                    style: TextStyle(
                      color: AppColors.goldPrimary,
                      fontSize: isMobile ? 16 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      feature,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
