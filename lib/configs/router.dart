import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tidoy_booking_app/constants/routes.dart';
import 'package:tidoy_booking_app/core/controllers/onboarding_controller.dart';
import 'package:tidoy_booking_app/screens/home.dart';
import 'package:tidoy_booking_app/screens/onboarding.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final seen = ref.watch(onboardingProvider);

  return GoRouter(
    initialLocation: AppRoutes.boarding,
    routes: [
      GoRoute(
        path: AppRoutes.boarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    redirect: (context, state) {
      final isOnboarding = state.matchedLocation == '/onboarding';

      if (seen && isOnboarding) return AppRoutes.home;
      if (!seen && !isOnboarding) return AppRoutes.boarding;

      return null;
    },
  );
});
