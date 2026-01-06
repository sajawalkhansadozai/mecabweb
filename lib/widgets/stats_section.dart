import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColors.greenGradient),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 60 : 80,
      ),
      child: Wrap(
        spacing: 40,
        runSpacing: 40,
        alignment: WrapAlignment.center,
        children: const [
          _StatItem(number: '50K+', label: 'Happy Customers'),
          _StatItem(number: '15+', label: 'Cities Covered'),
          _StatItem(number: '100%', label: 'Electric Fleet'),
          _StatItem(number: '24/7', label: 'Service Available'),
          _StatItem(number: '500+', label: 'Professional Drivers'),
          _StatItem(number: '4.8★', label: 'Average Rating'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;

  const _StatItem({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return SizedBox(
      width: isMobile ? (screenWidth / 2) - 40 : 200,
      child: Column(
        children: [
          Text(
            number,
            style: AppTextStyles.statNumber.copyWith(
              fontSize: isMobile ? 32 : 48,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 4 : 8),
          Text(
            label,
            style: AppTextStyles.statLabel.copyWith(
              fontSize: isMobile ? 12 : 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
