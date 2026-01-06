import 'package:flutter/material.dart';
import '../constants/colors.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      width: double.infinity,
      color: AppColors.bgBlack,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 80 : 120,
      ),
      child: Column(
        children: [
          // Section Header
          Text(
            'Why Choose Mecab?',
            style: TextStyle(
              fontSize: isMobile ? 36 : 56,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 16 : 20),
          Text(
            'Experience the future of transportation in Pakistan',
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              color: AppColors.textGray400,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 56 : 80),

          // Features Grid
          Wrap(
            spacing: 28,
            runSpacing: 28,
            alignment: WrapAlignment.center,
            children: const [
              _FeatureCard(
                icon: Icons.bolt_rounded,
                iconColor: AppColors.goldPrimary,
                title: '100% Electric',
                description:
                    'Eco-friendly rides with zero emissions. Contributing to a cleaner Pakistan.',
              ),
              _FeatureCard(
                icon: Icons.star_rounded,
                iconColor: AppColors.goldLight,
                title: 'Luxury Comfort',
                description:
                    'Premium vehicles with sophisticated interiors for a first-class experience.',
              ),
              _FeatureCard(
                icon: Icons.access_time_rounded,
                iconColor: AppColors.goldPrimary,
                title: '24/7 Available',
                description:
                    'Round-the-clock service with professional drivers ready to serve you.',
              ),
              _FeatureCard(
                icon: Icons.security_rounded,
                iconColor: AppColors.goldLight,
                title: 'Safe & Secure',
                description:
                    'GPS tracking, verified drivers, and emergency support for your safety.',
              ),
              _FeatureCard(
                icon: Icons.payment_rounded,
                iconColor: AppColors.goldPrimary,
                title: 'Easy Payment',
                description:
                    'Multiple payment options including cash, card, and digital wallets.',
              ),
              _FeatureCard(
                icon: Icons.speed_rounded,
                iconColor: AppColors.goldLight,
                title: 'Quick Booking',
                description:
                    'Book your ride in seconds with our user-friendly mobile app.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        transform: Matrix4.identity()
          ..translate(0.0, _isHovered ? -8.0 : 0.0, 0.0),
        width: isMobile ? double.infinity : 340,
        constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 360),
        padding: EdgeInsets.all(isMobile ? 28 : 36),
        decoration: BoxDecoration(
          color: AppColors.bgGray50,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _isHovered
                ? AppColors.goldPrimary.withValues(alpha: 0.5)
                : AppColors.borderGray200,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.goldPrimary.withValues(alpha: 0.15)
                  : Colors.black.withValues(alpha: 0.3),
              blurRadius: _isHovered ? 28 : 16,
              offset: Offset(0, _isHovered ? 14 : 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isMobile ? 68 : 76,
              height: isMobile ? 68 : 76,
              decoration: BoxDecoration(
                gradient: _isHovered
                    ? LinearGradient(
                        colors: [
                          widget.iconColor,
                          widget.iconColor.withValues(alpha: 0.7),
                        ],
                      )
                    : LinearGradient(
                        colors: [
                          widget.iconColor.withValues(alpha: 0.1),
                          widget.iconColor.withValues(alpha: 0.05),
                        ],
                      ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: widget.iconColor.withValues(
                    alpha: _isHovered ? 0.3 : 0.2,
                  ),
                  width: 2,
                ),
              ),
              child: Icon(
                widget.icon,
                color: _isHovered ? Colors.white : widget.iconColor,
                size: isMobile ? 32 : 36,
              ),
            ),
            SizedBox(height: isMobile ? 24 : 28),

            // Title
            Text(
              widget.title,
              style: TextStyle(
                fontSize: isMobile ? 22 : 24,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.2,
              ),
            ),
            SizedBox(height: isMobile ? 12 : 14),

            // Description
            Text(
              widget.description,
              style: TextStyle(
                fontSize: isMobile ? 15 : 16,
                color: AppColors.textGray400,
                height: 1.7,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
