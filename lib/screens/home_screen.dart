import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/hero_section_enhanced.dart';
import '../widgets/services_enhanced_section.dart';
import '../widgets/safety_highlight_section.dart';
import '../widgets/features_section.dart';
import '../widgets/stats_enhanced_section.dart';
import '../widgets/testimonials_enhanced_section.dart';
import '../widgets/download_app_enhanced_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_section.dart';
import 'privacy_policy_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    'home': GlobalKey(),
    'features': GlobalKey(),
    'services': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    final key = _sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _openPrivacyPolicy() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            // Scrollable Content
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  SizedBox(
                    height: topPadding + 70,
                  ), // Space for fixed navbar + status bar
                  // Hero Section
                  Container(
                    key: _sectionKeys['home'],
                    child: const HeroSectionEnhanced(),
                  ),

                  // Services Section
                  Container(
                    key: _sectionKeys['services'],
                    child: const ServicesEnhancedSection(),
                  ),

                  // Safety Highlight Section
                  const SafetyHighlightSection(),

                  // Features Section
                  Container(
                    key: _sectionKeys['features'],
                    child: const FeaturesSection(),
                  ),

                  // Stats Section
                  const StatsEnhancedSection(),

                  // Testimonials Section
                  const TestimonialsEnhancedSection(),

                  // Download App Section
                  const DownloadAppEnhancedSection(),

                  // Contact Section
                  Container(
                    key: _sectionKeys['contact'],
                    child: const ContactSection(),
                  ),

                  // Footer Section
                  FooterSection(onPrivacyTap: _openPrivacyPolicy),
                ],
              ),
            ),

            // Fixed Navigation Bar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: CustomNavigationBar(
                  onNavigate: _scrollToSection,
                  onPrivacyTap: _openPrivacyPolicy,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
