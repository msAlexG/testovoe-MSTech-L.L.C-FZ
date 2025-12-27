import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/bloc/subscription_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              'Строительные сметы',
              style: TextStyle(color: Colors.white),
            ),
            BlocBuilder<SubscriptionBloc, SubscriptionState>(
              builder: (context, state) {
                return state.selectedPlan != null
                    ? Text(
                        state.selectedPlan!.label,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.yellow, fontSize: 14),
                      )
                    : Text('', style: TextStyle(color: Colors.white));
              },
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF4CAF50),
      ),
      body: ColoredBox(
        color: const Color(0xFF424242),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Верхняя иллюстрация
              // Image.asset(
              //   'assets/images/smet_icon.png', // замените на свой путь
              //   height: 120,
              //   width: 120,
              //   fit: BoxFit.contain,
              // ),
              const SizedBox(height: 30),

              // Заголовок
              // const Text(
              //   'Сметогенератор',
              //   style: TextStyle(
              //     fontSize: 28,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.blueGrey,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              const SizedBox(height: 16),

              // Описание
              const Text(
                'Быстро и точно рассчитывайте стоимость строительных работ. Автоматизируйте создание смет и экономьте время.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Нижняя иллюстрация (например, график или список материалов)
              // Image.asset(
              //   'assets/images/construction.png', // замените на свой путь
              //   height: 150,
              //   width: 150,
              //   fit: BoxFit.contain,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
