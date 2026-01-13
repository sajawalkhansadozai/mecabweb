import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBlack,
      appBar: AppBar(
        backgroundColor: AppColors.bgBlack,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Privacy Policy',
          style: AppTextStyles.h4.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),
                  _PolicySection(
                    title: '1. Information We Collect',
                    body:
                        'We collect only the information needed to arrange and manage your rides.',
                    bullets: [
                      'Personal Information: full name; contact number (mobile/WhatsApp); pickup and drop-off locations; date and time of travel; vehicle preference; any details you share while booking.',
                      'Communication Data: messages exchanged via WhatsApp, Facebook Messenger, or other digital platforms; booking confirmations and service-related communications.',
                      'Technical Information (website only): IP address, browser type, device details, and access timestamps.',
                    ],
                  ),
                  _PolicySection(
                    title: '2. How We Use Your Information',
                    body:
                        'We process your data strictly to deliver and improve MECAB services.',
                    bullets: [
                      'Process and manage ride bookings, fare calculations, and price estimates.',
                      'Communicate booking details, updates, and customer support responses.',
                      'Assign drivers, manage operations, and enhance overall service quality.',
                      'We do not sell or rent your personal data to third parties.',
                    ],
                  ),
                  _PolicySection(
                    title: '3. WhatsApp & Messenger Communications',
                    bullets: [
                      'By contacting MECAB via WhatsApp or Facebook Messenger, you consent to receive messages about booking confirmations, fare details, ride updates, and support.',
                      'We comply with Meta messaging policies and do not send promotional messages without user consent.',
                    ],
                  ),
                  _PolicySection(
                    title: '4. Data Sharing & Disclosure',
                    body: 'We share your data only when necessary:',
                    bullets: [
                      'With drivers or operational staff to fulfill your booking.',
                      'With service providers (e.g., messaging or mapping services) strictly for operational needs.',
                      'When required by law, regulation, or legal request.',
                      'All third parties must protect the confidentiality of your data.',
                    ],
                  ),
                  _PolicySection(
                    title: '5. Data Security',
                    bullets: [
                      'We apply reasonable technical and organizational measures to prevent unauthorized access, loss, misuse, alteration, or disclosure.',
                      'No electronic transmission is 100% secure, but we work to minimize risk.',
                    ],
                  ),
                  _PolicySection(
                    title: '6. Data Retention',
                    bullets: [
                      'We keep personal data only as long as needed to fulfill bookings, maintain operational records, or meet legal obligations.',
                      'When data is no longer required, it is securely deleted or anonymized.',
                    ],
                  ),
                  _PolicySection(
                    title: '7. Your Rights',
                    bullets: [
                      'Request access to your personal information.',
                      'Request correction of inaccurate data.',
                      'Request deletion of your data (subject to legal requirements).',
                      'Opt out of non-essential communications.',
                      'Contact us using the details below to exercise these rights.',
                    ],
                  ),
                  _PolicySection(
                    title: '8. Cookies (Website Only)',
                    bullets: [
                      'MECAB may use cookies to improve user experience and analyze traffic.',
                      'You can disable cookies in your browser settings if you prefer.',
                    ],
                  ),
                  _PolicySection(
                    title: '9. Changes to This Policy',
                    bullets: [
                      'We may update this Privacy Policy at any time.',
                      'Changes will be posted on this page with an updated effective date.',
                    ],
                  ),
                  _PolicySection(
                    title: '10. Contact Information',
                    bullets: [
                      'MECAB Customer Support',
                      'Email: support@mecab.co',
                      'Phone / WhatsApp: +92 329 121 9999',
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.heroGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.goldPrimary, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: AppColors.goldPrimary.withValues(alpha: 0.12),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Privacy Policy - MECAB',
            style: AppTextStyles.h3.copyWith(color: AppColors.goldPrimary),
          ),
          const SizedBox(height: 8),
          Text(
            'Effective Date: 12 January 2026  |  Last Updated: 12 January 2026',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textGray600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'We are committed to protecting your privacy and safeguarding your personal information across our website, WhatsApp, Facebook Messenger, mobile communications, and chauffeur services.',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textGray700,
            ),
          ),
        ],
      ),
    );
  }
}

class _PolicySection extends StatelessWidget {
  final String title;
  final String? body;
  final List<String> bullets;

  const _PolicySection({
    required this.title,
    this.body,
    this.bullets = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.h4.copyWith(color: Colors.white)),
          if (body != null) ...[
            const SizedBox(height: 8),
            Text(
              body!,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textGray400,
              ),
            ),
          ],
          const SizedBox(height: 12),
          Column(
            children: bullets
                .map(
                  (b) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            '-',
                            style: TextStyle(color: AppColors.goldPrimary),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            b,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textGray600,
                              height: 1.55,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
