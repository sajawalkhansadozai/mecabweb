import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ServicesEnhancedSection extends StatelessWidget {
  const ServicesEnhancedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColors.softGreenGradient),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 80 : 120,
      ),
      child: Column(
        children: [
          // Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            decoration: BoxDecoration(
              gradient: AppColors.greenGradient,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: AppColors.goldPrimary.withValues(alpha: 0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Text(
              'MECAB APP',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 13,
                letterSpacing: 1.5,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 20 : 28),

          // Section Header
          Text(
            'One app, many services',
            style: TextStyle(
              fontSize: isMobile ? 36 : 56,
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
              height: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 16 : 20),

          // Subtitle
          Text(
            'Experience premium electric rides tailored to your needs',
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              color: AppColors.textGray600,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 48 : 72),

          // Services Grid
          Wrap(
            spacing: 28,
            runSpacing: 28,
            alignment: WrapAlignment.center,
            children: const [
              _EnhancedServiceCard(
                icon: Icons.location_city,
                iconColor: AppColors.goldPrimary,
                title: 'City Rides',
                description:
                    'Premium rides within the city at competitive prices',
                gradient: LinearGradient(
                  colors: [Color(0xFF000000), Color(0xFF0A0A0A)],
                ),
              ),
              _EnhancedServiceCard(
                icon: Icons.alt_route,
                iconColor: AppColors.goldLight,
                title: 'City to City',
                description: 'Comfortable long-distance travel between cities',
                gradient: LinearGradient(
                  colors: [Color(0xFF000000), Color(0xFF0A0A0A)],
                ),
              ),
              _EnhancedServiceCard(
                icon: Icons.flight,
                iconColor: AppColors.goldDark,
                title: 'Airport Transfer',
                description: 'Reliable airport pickup and drop-off services',
                gradient: LinearGradient(
                  colors: [Color(0xFF000000), Color(0xFF0A0A0A)],
                ),
              ),
              _EnhancedServiceCard(
                icon: Icons.business_center,
                iconColor: AppColors.gold900,
                title: 'Corporate Travel',
                description: 'Professional transportation for businesses',
                gradient: LinearGradient(
                  colors: [Color(0xFF000000), Color(0xFF0A0A0A)],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EnhancedServiceCard extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final LinearGradient gradient;

  const _EnhancedServiceCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.gradient,
  });

  @override
  State<_EnhancedServiceCard> createState() => _EnhancedServiceCardState();
}

class _EnhancedServiceCardState extends State<_EnhancedServiceCard> {
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
        width: isMobile ? double.infinity : 380,
        constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 400),
        padding: EdgeInsets.all(isMobile ? 28 : 36),
        decoration: BoxDecoration(
          gradient: widget.gradient,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _isHovered
                ? widget.iconColor.withValues(alpha: 0.4)
                : Colors.white.withValues(alpha: 0.6),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? widget.iconColor.withValues(alpha: 0.15)
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: _isHovered ? 24 : 12,
              offset: Offset(0, _isHovered ? 12 : 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Container
            Container(
              width: isMobile ? 64 : 72,
              height: isMobile ? 64 : 72,
              decoration: BoxDecoration(
                color: widget.iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: widget.iconColor.withValues(alpha: 0.2),
                  width: 2,
                ),
              ),
              child: Icon(
                widget.icon,
                size: isMobile ? 32 : 36,
                color: widget.iconColor,
              ),
            ),
            SizedBox(height: isMobile ? 20 : 24),

            // Title
            Text(
              widget.title,
              style: TextStyle(
                fontSize: isMobile ? 24 : 28,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
                height: 1.2,
              ),
            ),
            SizedBox(height: isMobile ? 12 : 14),

            // Description
            Text(
              widget.description,
              style: TextStyle(
                fontSize: isMobile ? 15 : 16,
                color: AppColors.textGray600,
                height: 1.6,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: isMobile ? 20 : 24),

            // Learn More Link
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: Row(
                children: [
                  Text(
                    'Learn more',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: widget.iconColor,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(width: 6),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: Matrix4.identity()
                      ..translate(_isHovered ? 4.0 : 0.0, 0.0, 0.0),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: widget.iconColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
