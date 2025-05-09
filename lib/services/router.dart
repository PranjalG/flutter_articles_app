import 'package:flutter_article_app/presentation/screens/landing_screen.dart';
import 'package:flutter_article_app/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/details', builder: (context, state) => const LandingScreen()),
  ],
);
