import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../services/db/firebase_auth_service.dart';
import '../views/login_page.dart';
import '../views/register_page.dart';
import '../views/dashboard_page.dart';
import '../views/add_country_page.dart';

class AppRouter {
  static GoRouter getRouter(BuildContext context) {
    final authService = Provider.of<FirebaseAuthService>(context, listen: true);

    return GoRouter(
      initialLocation: '/login',
      refreshListenable: authService,
      redirect: (context, state) {
        if (!authService.initialized) return null;

        final loggedIn = authService.isLoggedIn;
        final loggingIn = state.matchedLocation == '/login' || state.matchedLocation == '/register';

        if (!loggedIn && !loggingIn) return '/login';
        if (loggedIn && loggingIn) return '/dashboard';
        return null;
      },
      routes: [
        GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
        GoRoute(path: '/register', builder: (_, __) => const RegisterPage()),
        GoRoute(path: '/dashboard', builder: (_, __) => const DashboardPage()),
        GoRoute(path: '/add-country', builder: (_, __) => const AddCountryPage()),
      ],
    );
  }
}