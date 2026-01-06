import 'package:flutter/material.dart';
import '../constants/colors.dart';

class StatsEnhancedSection extends StatelessWidget {
  const StatsEnhancedSection({super.key});

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
            AppColors.goldDark,
            AppColors.goldPrimary,
            AppColors.goldLight,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 80 : 100,
      ),
      child: Column(
        children: [
          // Section Header (Optional)
          Text(
            'Trusted by Thousands',
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 48 : 64),

          // Stats Grid
          Wrap(
            spacing: isMobile ? 32 : 56,
            runSpacing: isMobile ? 48 : 64,
            alignment: WrapAlignment.center,
            children: const [
              _AnimatedStatItem(
                number: '50K+',
                label: 'Happy Customers',
                icon: Icons.people_rounded,
              ),
              _AnimatedStatItem(
                number: '15+',
                label: 'Cities Covered',
                icon: Icons.location_city_rounded,
              ),
              _AnimatedStatItem(
                number: '100%',
                label: 'Electric Fleet',
                icon: Icons.electric_car_rounded,
              ),
              _AnimatedStatItem(
                number: '24/7',
                label: 'Service Available',
                icon: Icons.access_time_rounded,
              ),
              _AnimatedStatItem(
                number: '500+',
                label: 'Professional Drivers',
                icon: Icons.badge_rounded,
              ),
              _AnimatedStatItem(
                number: '4.8★',
                label: 'Average Rating',
                icon: Icons.star_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnimatedStatItem extends StatefulWidget {
  final String number;
  final String label;
  final IconData icon;

  const _AnimatedStatItem({
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  State<_AnimatedStatItem> createState() => _AnimatedStatItemState();
}

class _AnimatedStatItemState extends State<_AnimatedStatItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Start animation after a short delay
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _controller.forward();
    });
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

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.identity()
                  ..translate(0.0, _isHovered ? -6.0 : 0.0, 0.0),
                child: SizedBox(
                  width: isMobile ? 150 : 180,
                  child: Column(
                    children: [
                      // Icon Container
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: isMobile ? 72 : 84,
                        height: isMobile ? 72 : 84,
                        decoration: BoxDecoration(
                          color: _isHovered
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withValues(
                              alpha: _isHovered ? 1.0 : 0.3,
                            ),
                            width: 2,
                          ),
                          boxShadow: _isHovered
                              ? [
                                  BoxShadow(
                                    color: Colors.white.withValues(alpha: 0.3),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  ),
                                ]
                              : [],
                        ),
                        child: Icon(
                          widget.icon,
                          size: isMobile ? 36 : 42,
                          color: _isHovered
                              ? AppColors.goldPrimary
                              : Colors.white,
                        ),
                      ),
                      SizedBox(height: isMobile ? 20 : 24),

                      // Number
                      Text(
                        widget.number,
                        style: TextStyle(
                          fontSize: isMobile ? 40 : 52,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          height: 1,
                          shadows: [
                            Shadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              offset: const Offset(0, 2),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: isMobile ? 8 : 12),

                      // Label
                      Text(
                        widget.label,
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.white.withValues(alpha: 0.95),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
