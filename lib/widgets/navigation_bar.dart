import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class CustomNavigationBar extends StatefulWidget {
  final Function(String) onNavigate;
  final VoidCallback? onPrivacyTap;

  const CustomNavigationBar({
    super.key,
    required this.onNavigate,
    this.onPrivacyTap,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgBlack,
        boxShadow: [
          BoxShadow(
            color: AppColors.goldPrimary.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 70,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth > 600 ? 24 : 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'MECAB',
                        style: AppTextStyles.h3.copyWith(
                          color: AppColors.goldPrimary,
                          fontSize: screenWidth > 600 ? 28 : 24,
                        ),
                      ),
                      if (screenWidth > 400) ...[
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            'Luxury Electric Taxi',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textGray600,
                              fontSize: screenWidth > 600 ? 14 : 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // Desktop Navigation
                if (isDesktop)
                  Row(
                    children: [
                      _NavLink('Home', () => widget.onNavigate('home')),
                      const SizedBox(width: 32),
                      _NavLink('Services', () => widget.onNavigate('services')),
                      const SizedBox(width: 32),
                      _NavLink('Features', () => widget.onNavigate('features')),
                      const SizedBox(width: 32),
                      _NavLink('Contact', () => widget.onNavigate('contact')),
                      if (widget.onPrivacyTap != null) ...[
                        const SizedBox(width: 32),
                        _NavLink('Privacy', widget.onPrivacyTap!),
                      ],
                      const SizedBox(width: 32),
                      const _BookNowButton(),
                    ],
                  ),

                // Mobile Menu
                if (!isDesktop)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _BookNowButton(compact: true),
                      IconButton(
                        icon: Icon(
                          _isMenuOpen ? Icons.close : Icons.menu,
                          color: AppColors.goldPrimary,
                        ),
                        onPressed: () {
                          setState(() {
                            _isMenuOpen = !_isMenuOpen;
                          });
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),

          // Mobile Menu Dropdown
          if (!isDesktop && _isMenuOpen)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  _MobileNavLink('Home', () {
                    widget.onNavigate('home');
                    setState(() => _isMenuOpen = false);
                  }),
                  _MobileNavLink('Services', () {
                    widget.onNavigate('services');
                    setState(() => _isMenuOpen = false);
                  }),
                  _MobileNavLink('Features', () {
                    widget.onNavigate('features');
                    setState(() => _isMenuOpen = false);
                  }),
                  _MobileNavLink('Contact', () {
                    widget.onNavigate('contact');
                    setState(() => _isMenuOpen = false);
                  }),
                  if (widget.onPrivacyTap != null)
                    _MobileNavLink('Privacy', () {
                      widget.onPrivacyTap!();
                      setState(() => _isMenuOpen = false);
                    }),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _NavLink(this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textGray700),
      ),
    );
  }
}

class _MobileNavLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _MobileNavLink(this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Text(
          text,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textGray700,
          ),
        ),
      ),
    );
  }
}

class _BookNowButton extends StatelessWidget {
  final bool compact;

  const _BookNowButton({this.compact = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.greenGradient,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 16 : 24,
            vertical: compact ? 8 : 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          'Book Now',
          style: AppTextStyles.button.copyWith(fontSize: compact ? 14 : 16),
        ),
      ),
    );
  }
}
