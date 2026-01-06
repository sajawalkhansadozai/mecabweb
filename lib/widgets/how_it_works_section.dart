import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

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
              'How It Works',
              style: AppTextStyles.h2.copyWith(fontSize: isMobile ? 28 : 36),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 0),
            child: Text(
              'Book your ride in just a few simple steps',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textGray600,
                fontSize: isMobile ? 16 : 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: isMobile ? 40 : 64),

          // Steps
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Wrap(
              spacing: 32,
              runSpacing: 40,
              alignment: WrapAlignment.center,
              children: const [
                _StepCard(
                  stepNumber: '1',
                  icon: Icons.download,
                  title: 'Download App',
                  description: 'Get the Mecab app from Play Store or App Store',
                ),
                _StepCard(
                  stepNumber: '2',
                  icon: Icons.person_add,
                  title: 'Sign Up',
                  description:
                      'Create your account in seconds with your phone number',
                ),
                _StepCard(
                  stepNumber: '3',
                  icon: Icons.location_on,
                  title: 'Set Location',
                  description: 'Enter your pickup and drop-off locations',
                ),
                _StepCard(
                  stepNumber: '4',
                  icon: Icons.directions_car,
                  title: 'Book Ride',
                  description:
                      'Confirm your booking and track your driver in real-time',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  final String stepNumber;
  final IconData icon;
  final String title;
  final String description;

  const _StepCard({
    required this.stepNumber,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return SizedBox(
      width: isMobile ? screenWidth - 32 : 220,
      child: Column(
        children: [
          // Step Number Badge
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: isMobile ? 80 : 100,
                height: isMobile ? 80 : 100,
                decoration: BoxDecoration(
                  gradient: AppColors.greenGradient,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.goldPrimary.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: isMobile ? 36 : 44,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: isMobile ? 28 : 32,
                  height: isMobile ? 28 : 32,
                  decoration: BoxDecoration(
                    color: AppColors.gold900,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      stepNumber,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 16 : 20),

          // Title
          Text(
            title,
            style: AppTextStyles.h4.copyWith(fontSize: isMobile ? 18 : 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 8 : 12),

          // Description
          Text(
            description,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: isMobile ? 14 : 16,
              color: AppColors.textGray600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
