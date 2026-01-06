import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      width: double.infinity,
      color: AppColors.bgGray50,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 60 : 80,
      ),
      child: Column(
        children: [
          // Section Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 0),
            child: Text(
              'What Our Customers Say',
              style: AppTextStyles.h2.copyWith(fontSize: isMobile ? 28 : 36),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 0),
            child: Text(
              'Real experiences from our valued customers',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textGray600,
                fontSize: isMobile ? 16 : 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: isMobile ? 40 : 64),

          // Testimonials
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: const [
              _TestimonialCard(
                name: 'Ahmed Khan',
                role: 'Business Executive',
                testimonial:
                    'Mecab has completely changed my daily commute. The electric vehicles are quiet, comfortable, and the drivers are always professional. Highly recommended!',
                rating: 5,
              ),
              _TestimonialCard(
                name: 'Sara Ali',
                role: 'Marketing Manager',
                testimonial:
                    'I love that Mecab is eco-friendly! The app is super easy to use and the rides are always on time. Perfect for getting to meetings across the city.',
                rating: 5,
              ),
              _TestimonialCard(
                name: 'Usman Malik',
                role: 'Entrepreneur',
                testimonial:
                    'The luxury experience is unmatched. Clean cars, courteous drivers, and competitive pricing. Mecab is my go-to choice for all travel needs.',
                rating: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final String name;
  final String role;
  final String testimonial;
  final int rating;

  const _TestimonialCard({
    required this.name,
    required this.role,
    required this.testimonial,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      width: isMobile ? screenWidth - 32 : 350,
      constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 380),
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      decoration: BoxDecoration(
        color: AppColors.bgGray50,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.goldPrimary.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rating Stars
          Row(
            children: List.generate(
              rating,
              (index) =>
                  const Icon(Icons.star, color: Color(0xFFFFB800), size: 20),
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),

          // Testimonial
          Text(
            testimonial,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: isMobile ? 14 : 16,
              color: AppColors.textGray700,
              height: 1.6,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 20),

          // Divider
          Container(height: 1, color: AppColors.borderGray200),
          SizedBox(height: isMobile ? 12 : 16),

          // Author
          Row(
            children: [
              CircleAvatar(
                radius: isMobile ? 20 : 24,
                backgroundColor: AppColors.goldLight.withValues(alpha: 0.2),
                child: Text(
                  name[0],
                  style: TextStyle(
                    color: AppColors.goldPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 18 : 20,
                  ),
                ),
              ),
              SizedBox(width: isMobile ? 12 : 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      role,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textGray600,
                        fontSize: isMobile ? 12 : 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
