import 'package:go_router/go_router.dart';
import 'package:onboarding/home.dart';
import 'package:onboarding/main.dart';
import 'package:onboarding/onboarding.dart';
import 'package:onboarding/paywall.dart';
import 'package:onboarding/subscriptionSuccessScreen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'main',
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/paywallScreen',
      name: 'paywallScreen',
      builder: (context, state) => const PaywallScreen(),
    ),
    GoRoute(
      path: '/subscriptionSuccess',
      name: 'subscriptionSuccessScreen',
      builder: (context, state) => const SubscriptionSuccessScreen(),
    ),
  ],
);
