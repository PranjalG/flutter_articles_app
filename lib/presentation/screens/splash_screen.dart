import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _navigateToLanding();
  }

  void _navigateToLanding() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.go('/details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Center(
          child: Image.asset(
            "assets/images/splash_book_icon.png",
            height: 162,
            width: 162,
          ),
        ),
      ),
    );
  }
}
