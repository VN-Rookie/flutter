import 'package:go_router/go_router.dart';
import '../config/router.dart';
import '../screens/onboarding_screen.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/registration_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: ROUTE.banner,
  routes: [
    GoRoute(
      path: ROUTE.banner,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: ROUTE.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: ROUTE.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: ROUTE.register,
      builder: (context, state) => const RegistrationScreen(),
    ),
  ],
);
