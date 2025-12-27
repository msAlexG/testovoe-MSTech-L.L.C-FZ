import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/bloc/subscription_bloc.dart';
import 'package:onboarding/home.dart';

import 'package:onboarding/navigation.dart';
import 'package:onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubscriptionBloc(),
      child: MaterialApp.router(
        title: 'Сметы PRO',
        routerConfig: router,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Roboto', // Можно заменить на любой шрифт
        ),
        // home: const WelcomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    SubscriptionBloc subscriptionBloc = context.read<SubscriptionBloc>();
    subscriptionBloc.add(LoadPlan());

    return BlocBuilder<SubscriptionBloc, SubscriptionState>(
      builder: (context, plan) {
        return plan.selectedPlan == null
            ? const OnboardingScreen()
            : HomeScreen();
      },
    );
  }
}
