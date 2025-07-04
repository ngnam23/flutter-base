import 'package:go_router/go_router.dart';
import 'package:tidoy_booking_app/constants/routes.dart';
import 'package:tidoy_booking_app/screens/home.dart';

// GoRouter configuration
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
