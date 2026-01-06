import 'package:flutter/material.dart';
import '../constants/colors.dart';

class DownloadAppEnhancedSection extends StatelessWidget {
  const DownloadAppEnhancedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.goldPrimary,
            AppColors.goldLight,
            AppColors.goldVeryLight,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 80 : 120,
      ),
      child: Column(
        children: [
          // Floating Phone Icon
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 800),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, -10 * (1 - value)),
                child: Opacity(
                  opacity: value,
                  child: Container(
                    width: isMobile ? 100 : 120,
                    height: isMobile ? 100 : 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 40,
                          offset: const Offset(0, 20),
                        ),
                        BoxShadow(
                          color: Colors.white.withValues(alpha: 0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.phone_iphone_rounded,
                      size: isMobile ? 50 : 60,
                      color: AppColors.goldPrimary,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: isMobile ? 32 : 48),

          // Heading
          Text(
            'Download Mecab App',
            style: TextStyle(
              fontSize: isMobile ? 40 : 60,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.1,
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 16 : 24),

          // Subtitle
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              'Available on iOS and Android. Start your journey with Pakistan\'s first luxury electric taxi service today!',
              style: TextStyle(
                fontSize: isMobile ? 17 : 20,
                color: Colors.white.withValues(alpha: 0.95),
                height: 1.6,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: isMobile ? 48 : 64),

          // App Store Buttons
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: const [
              _EnhancedAppStoreButton(
                icon: Icons.apple,
                title: 'Download on the',
                subtitle: 'App Store',
                isDark: true,
              ),
              _EnhancedAppStoreButton(
                icon: Icons.play_arrow_rounded,
                title: 'Get it on',
                subtitle: 'Google Play',
                isDark: false,
              ),
            ],
          ),
          SizedBox(height: isMobile ? 48 : 64),

          // Features
          Wrap(
            spacing: isMobile ? 24 : 48,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _FeatureBadge(
                icon: Icons.download_rounded,
                text: 'Free Download',
                isMobile: isMobile,
              ),
              _FeatureBadge(
                icon: Icons.verified_user_rounded,
                text: 'Secure & Safe',
                isMobile: isMobile,
              ),
              _FeatureBadge(
                icon: Icons.speed_rounded,
                text: 'Quick Booking',
                isMobile: isMobile,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EnhancedAppStoreButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isDark;

  const _EnhancedAppStoreButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isDark,
  });

  @override
  State<_EnhancedAppStoreButton> createState() =>
      _EnhancedAppStoreButtonState();
}

class _EnhancedAppStoreButtonState extends State<_EnhancedAppStoreButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..scale(_isHovered ? 1.05 : 1.0, _isHovered ? 1.05 : 1.0, 1.0),
        child: Container(
          width: isMobile ? double.infinity : 220,
          constraints: BoxConstraints(
            maxWidth: isMobile ? double.infinity : 240,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 28,
            vertical: isMobile ? 14 : 16,
          ),
          decoration: BoxDecoration(
            color: widget.isDark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: widget.isDark
                  ? Colors.white.withValues(alpha: 0.2)
                  : Colors.black.withValues(alpha: 0.1),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _isHovered ? 0.3 : 0.2),
                blurRadius: _isHovered ? 20 : 12,
                offset: Offset(0, _isHovered ? 10 : 6),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: isMobile ? 36 : 40,
                color: widget.isDark ? Colors.white : Colors.black,
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 11,
                        color: widget.isDark
                            ? Colors.white.withValues(alpha: 0.8)
                            : Colors.black.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 20,
                        fontWeight: FontWeight.w700,
                        color: widget.isDark ? Colors.white : Colors.black,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isMobile;

  const _FeatureBadge({
    required this.icon,
    required this.text,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 20,
        vertical: isMobile ? 10 : 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: isMobile ? 18 : 20),
          SizedBox(width: isMobile ? 8 : 10),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 14 : 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
