import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      width: double.infinity,
      color: AppColors.bgBlack,
      padding: EdgeInsets.all(isMobile ? 24 : 48),
      child: Column(
        children: [
          // Footer Content
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _FooterColumn(
                title: 'MECAB',
                isBrand: true,
                items: const [
                  'MECAB – Luxury Chauffeur & E-Cab Services. Premium chauffeur-driven electric and luxury vehicles for airport transfers, corporate travel, city rides, and events.',
                ],
              ),
              _FooterColumn(
                title: 'Quick Links',
                items: const ['About Us', 'Services', 'Careers', 'Blog'],
              ),
              _FooterColumn(
                title: 'Support',
                items: const [
                  'Help Center',
                  'Safety',
                  'Terms of Service',
                  'Privacy Policy',
                ],
              ),
              _FooterColumn(
                title: 'Contact',
                items: const [
                  '📧 support@mecab.co',
                  '📱 +92 329 121 9999',
                  '📍 Pakistan',
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Copyright
          Container(
            padding: const EdgeInsets.only(top: 32),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.borderGray200, width: 1),
              ),
            ),
            child: Text(
              '© 2024 Mecab. All rights reserved. Made with 💛 in Pakistan',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textGray400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;
  final bool isBrand;

  const _FooterColumn({
    required this.title,
    required this.items,
    this.isBrand = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return SizedBox(
      width: isMobile ? double.infinity : 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: AppTextStyles.h4.copyWith(
              color: isBrand ? const Color(0xFF10b981) : Colors.white,
            ),
          ),
          const SizedBox(height: 16),

          // Items
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                item,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textGray400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
