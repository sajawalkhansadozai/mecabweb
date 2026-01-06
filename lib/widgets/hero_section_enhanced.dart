import 'package:flutter/material.dart';
import '../constants/colors.dart';

class HeroSectionEnhanced extends StatefulWidget {
  const HeroSectionEnhanced({super.key});

  @override
  State<HeroSectionEnhanced> createState() => _HeroSectionEnhancedState();
}

class _HeroSectionEnhancedState extends State<HeroSectionEnhanced>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    return Container(
      width: double.infinity,
      height: isMobile ? 600 : 700,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.goldDark,
            AppColors.goldPrimary,
            AppColors.goldLight,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            left: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.03),
              ),
            ),
          ),

          // Main Content
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 24 : (isTablet ? 48 : 80),
                      vertical: 40,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.electric_bolt,
                                color: Colors.white,
                                size: isMobile ? 16 : 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '100% Electric • Zero Emissions',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isMobile ? 12 : 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: isMobile ? 32 : 48),

                        // Main Heading
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: isMobile ? 48 : (isTablet ? 64 : 80),
                              fontWeight: FontWeight.w900,
                              height: 1.1,
                              letterSpacing: -1,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Luxury ',
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: 'Electric\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: AppColors.goldVeryLight,
                                      blurRadius: 30,
                                    ),
                                  ],
                                ),
                              ),
                              const TextSpan(
                                text: 'Rides for ',
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: 'Pakistan',
                                style: TextStyle(
                                  foreground: Paint()
                                    ..shader =
                                        const LinearGradient(
                                          colors: [
                                            Color(0xFFd1fae5),
                                            Colors.white,
                                          ],
                                        ).createShader(
                                          const Rect.fromLTWH(0, 0, 200, 70),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: isMobile ? 24 : 32),

                        // Subtitle
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 700),
                          child: Text(
                            'Experience premium comfort and eco-friendly travel with Pakistan\'s most luxurious electric taxi service',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isMobile ? 16 : 20,
                              color: Colors.white.withValues(alpha: 0.95),
                              height: 1.6,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: isMobile ? 40 : 56),

                        // CTA Buttons
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          alignment: WrapAlignment.center,
                          children: [
                            _EnhancedButton(
                              text: 'Download App',
                              icon: Icons.phone_android,
                              isPrimary: true,
                              onPressed: () {},
                              isMobile: isMobile,
                            ),
                            _EnhancedButton(
                              text: 'Learn More',
                              icon: Icons.arrow_forward,
                              isPrimary: false,
                              onPressed: () {},
                              isMobile: isMobile,
                            ),
                          ],
                        ),
                        SizedBox(height: isMobile ? 40 : 56),

                        // Stats
                        Wrap(
                          spacing: isMobile ? 24 : 48,
                          runSpacing: 24,
                          alignment: WrapAlignment.center,
                          children: [
                            _StatItem(
                              value: '50K+',
                              label: 'Happy Riders',
                              isMobile: isMobile,
                            ),
                            _StatItem(
                              value: '15+',
                              label: 'Cities',
                              isMobile: isMobile,
                            ),
                            _StatItem(
                              value: '4.8★',
                              label: 'Rating',
                              isMobile: isMobile,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EnhancedButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onPressed;
  final bool isMobile;

  const _EnhancedButton({
    required this.text,
    required this.icon,
    required this.isPrimary,
    required this.onPressed,
    required this.isMobile,
  });

  @override
  State<_EnhancedButton> createState() => _EnhancedButtonState();
}

class _EnhancedButtonState extends State<_EnhancedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..scale(_isHovered ? 1.05 : 1.0, _isHovered ? 1.05 : 1.0, 1.0),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.isPrimary
                ? Colors.white
                : Colors.white.withValues(alpha: 0.1),
            foregroundColor: widget.isPrimary
                ? AppColors.goldPrimary
                : Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: widget.isMobile ? 28 : 36,
              vertical: widget.isMobile ? 16 : 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: widget.isPrimary
                  ? BorderSide.none
                  : BorderSide(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 2,
                    ),
            ),
            elevation: _isHovered ? 8 : 4,
            shadowColor: Colors.black.withValues(alpha: 0.3),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: widget.isMobile ? 15 : 17,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(width: 8),
              Icon(widget.icon, size: widget.isMobile ? 18 : 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final bool isMobile;

  const _StatItem({
    required this.value,
    required this.label,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: isMobile ? 32 : 40,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            height: 1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: isMobile ? 12 : 14,
            color: Colors.white.withValues(alpha: 0.8),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
