import 'package:flutter_article_app/presentation/screens/home_screen.dart';
import 'package:flutter_article_app/presentation/screens/landing_screen.dart';
import 'package:flutter_article_app/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/detail_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home_screen',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'detail_screen',
          builder: (context, state) {
            final data = state.extra as Map<String, String>;
            final title = data['title'] ?? '';
            final subtitle = data['subtitle'] ?? '';
            return DetailScreen(title: title, subtitle: subtitle);
          },
        ),
      ]
    ),
  ],
);
