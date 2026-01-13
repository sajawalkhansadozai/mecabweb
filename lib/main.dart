import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'widgets/splash_screen.dart';

void main() {
  runApp(const MecabApp());
}

class MecabApp extends StatefulWidget {
  const MecabApp({super.key});

  @override
  State<MecabApp> createState() => _MecabAppState();
}

class _MecabAppState extends State<MecabApp> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    // Show splash for 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showSplash = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mecab - Luxury Electric Taxi Service Pakistan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4AF37),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF000000),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            _showSplash ? const SplashScreen() : const HomeScreen(),
        '/privacy-policy': (context) => const PrivacyPolicyScreen(),
      },
    );
  }
}
