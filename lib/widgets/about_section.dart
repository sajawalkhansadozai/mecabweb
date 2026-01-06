import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      width: double.infinity,
      color: AppColors.bgBlack,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 60 : 80,
      ),
      child: Column(
        children: [
          // Section Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 0),
            child: Text(
              'About Mecab',
              style: AppTextStyles.h2.copyWith(fontSize: isMobile ? 28 : 36),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 0),
            child: Text(
              'Premium chauffeur-driven electric and luxury vehicles for all your transportation needs',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textGray600,
                fontSize: isMobile ? 16 : 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: isMobile ? 40 : 64),

          // Content
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 32,
              runSpacing: 32,
              alignment: WrapAlignment.center,
              children: [
                _AboutCard(
                  icon: Icons.directions_car,
                  title: 'Chauffeur-driven Luxury Cars',
                  description:
                      'Professional chauffeur service with premium luxury vehicles for a first-class travel experience.',
                ),
                _AboutCard(
                  icon: Icons.electric_car,
                  title: 'Electric Vehicle Rides',
                  description:
                      'Eco-friendly electric vehicles providing smooth, quiet, and sustainable transportation solutions.',
                ),
                _AboutCard(
                  icon: Icons.business_center,
                  title: 'Corporate Transport Solutions',
                  description:
                      'Reliable and professional transportation services tailored for corporate clients and business needs.',
                ),
                _AboutCard(
                  icon: Icons.support_agent,
                  title: '24/7 Support',
                  description:
                      'Round-the-clock customer support team ready to assist you for a seamless experience.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _AboutCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      width: isMobile ? screenWidth - 32 : 400,
      constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 420),
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderGold100, width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, size: isMobile ? 40 : 48, color: AppColors.goldPrimary),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            title,
            style: AppTextStyles.h4.copyWith(
              fontSize: isMobile ? 18 : 20,
              color: AppColors.goldPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 8 : 12),
          Text(
            description,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: isMobile ? 14 : 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
