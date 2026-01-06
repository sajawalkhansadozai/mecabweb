import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TestimonialsEnhancedSection extends StatelessWidget {
  const TestimonialsEnhancedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.bgBlack, AppColors.bgGray50],
        ),
      ),
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
              color: AppColors.goldPrimary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: AppColors.goldPrimary.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: AppColors.goldPrimary,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  '4.8 Rating',
                  style: TextStyle(
                    color: AppColors.goldPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 20 : 28),

          // Section Header
          Text(
            'What Our Customers Say',
            style: TextStyle(
              fontSize: isMobile ? 36 : 56,
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
              height: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 16 : 20),
          Text(
            'Real experiences from our valued customers',
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              color: AppColors.textGray600,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 56 : 80),

          // Testimonials
          Wrap(
            spacing: 28,
            runSpacing: 28,
            alignment: WrapAlignment.center,
            children: const [
              _EnhancedTestimonialCard(
                name: 'Ahmed Khan',
                role: 'Business Executive',
                testimonial:
                    'Mecab has completely changed my daily commute. The electric vehicles are quiet, comfortable, and the drivers are always professional. Highly recommended!',
                rating: 5,
                avatarColor: AppColors.goldPrimary,
              ),
              _EnhancedTestimonialCard(
                name: 'Sara Ali',
                role: 'Marketing Manager',
                testimonial:
                    'I love that Mecab is eco-friendly! The app is super easy to use and the rides are always on time. Perfect for getting to meetings across the city.',
                rating: 5,
                avatarColor: Color(0xFF8b5cf6),
              ),
              _EnhancedTestimonialCard(
                name: 'Usman Malik',
                role: 'Entrepreneur',
                testimonial:
                    'The luxury experience is unmatched. Clean cars, courteous drivers, and competitive pricing. Mecab is my go-to choice for all travel needs.',
                rating: 5,
                avatarColor: AppColors.goldLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EnhancedTestimonialCard extends StatefulWidget {
  final String name;
  final String role;
  final String testimonial;
  final int rating;
  final Color avatarColor;

  const _EnhancedTestimonialCard({
    required this.name,
    required this.role,
    required this.testimonial,
    required this.rating,
    required this.avatarColor,
  });

  @override
  State<_EnhancedTestimonialCard> createState() =>
      _EnhancedTestimonialCardState();
}

class _EnhancedTestimonialCardState extends State<_EnhancedTestimonialCard> {
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
          color: AppColors.bgGray50,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _isHovered
                ? widget.avatarColor.withValues(alpha: 0.3)
                : AppColors.borderGray200,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? widget.avatarColor.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.04),
              blurRadius: _isHovered ? 28 : 16,
              offset: Offset(0, _isHovered ? 14 : 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quote Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    widget.avatarColor,
                    widget.avatarColor.withValues(alpha: 0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.format_quote,
                color: AppColors.bgBlack,
                size: 28,
              ),
            ),
            SizedBox(height: isMobile ? 20 : 24),

            // Testimonial Text
            Text(
              widget.testimonial,
              style: TextStyle(
                fontSize: isMobile ? 15 : 16,
                color: AppColors.textGray600,
                height: 1.7,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: isMobile ? 24 : 28),

            // Rating Stars
            Row(
              children: List.generate(
                widget.rating,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.star_rounded,
                    color: Color(0xFFf59e0b),
                    size: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: isMobile ? 20 : 24),

            // Divider
            Container(
              height: 1,
              width: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    widget.avatarColor,
                    widget.avatarColor.withValues(alpha: 0.2),
                  ],
                ),
              ),
            ),
            SizedBox(height: isMobile ? 20 : 24),

            // User Info
            Row(
              children: [
                // Avatar
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        widget.avatarColor,
                        widget.avatarColor.withValues(alpha: 0.8),
                      ],
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.avatarColor.withValues(alpha: 0.3),
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.name.split(' ').map((n) => n[0]).join(),
                      style: const TextStyle(
                        color: AppColors.bgBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Name and Role
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: isMobile ? 17 : 18,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.role,
                        style: TextStyle(
                          fontSize: isMobile ? 13 : 14,
                          color: AppColors.textGray600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // Verified Badge
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: widget.avatarColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.verified,
                    color: widget.avatarColor,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
