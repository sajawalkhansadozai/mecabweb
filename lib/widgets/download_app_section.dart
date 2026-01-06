import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class DownloadAppSection extends StatelessWidget {
  const DownloadAppSection({super.key});

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
      child: Column(
        children: [
          // Icon
          Container(
            width: isMobile ? 80 : 100,
            height: isMobile ? 80 : 100,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              Icons.phone_android,
              size: isMobile ? 40 : 50,
              color: AppColors.goldPrimary,
            ),
          ),
          SizedBox(height: isMobile ? 24 : 32),

          // Heading
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 0),
            child: Text(
              'Download Mecab App',
              style: AppTextStyles.h2.copyWith(
                fontSize: isMobile ? 28 : 36,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 0),
              child: Text(
                'Available on iOS and Android. Start your journey with Pakistan\'s first luxury electric taxi service today!',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: Colors.white,
                  fontSize: isMobile ? 16 : 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 32 : 40),

          // App Store Buttons
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _AppStoreButton(
                icon: Icons.apple,
                store: 'App Store',
                label: 'Download on the',
                isMobile: isMobile,
              ),
              _AppStoreButton(
                icon: Icons.play_arrow,
                store: 'Google Play',
                label: 'Get it on',
                isMobile: isMobile,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AppStoreButton extends StatelessWidget {
  final IconData icon;
  final String store;
  final String label;
  final bool isMobile;

  const _AppStoreButton({
    required this.icon,
    required this.store,
    required this.label,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 24,
              vertical: isMobile ? 12 : 14,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: isMobile ? 32 : 40, color: AppColors.textDark),
                SizedBox(width: isMobile ? 8 : 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: isMobile ? 10 : 12,
                        color: AppColors.textGray600,
                      ),
                    ),
                    Text(
                      store,
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
