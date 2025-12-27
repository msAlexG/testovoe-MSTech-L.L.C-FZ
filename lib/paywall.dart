import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding/bloc/subscription_bloc.dart';
import 'package:onboarding/model/subscriptionPlan.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SubscriptionBloc subscriptionBloc = context.read<SubscriptionBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите подписку'),
        centerTitle: true,
        backgroundColor: const Color(0xFF4CAF50),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: BlocSelector<SubscriptionBloc, SubscriptionState, SubscriptionPlan?>(
          selector: (state) {
            return state.selectedPlan;
          },
          builder: (context, selectedPlan) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Получите полный доступ к Сметогенератору',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Месячная подписка
                _SubscriptionTile(
                  title: 'Месячная подписка',
                  price: '499 ₽ / месяц',
                  description:
                      'Полный доступ на 30 дней. Отмена в любой момент.',
                  popular: selectedPlan == SubscriptionPlan.monthly
                      ? true
                      : false,
                  onSelect: () {
                    subscriptionBloc.add(SelectPlan(SubscriptionPlan.monthly));

                    // TODO: сохранить выбор (например, через BLoC или состояние)
                  },
                ),
                const SizedBox(height: 16),

                // Годовая подписка (со скидкой)
                _SubscriptionTile(
                  title: 'Годовая подписка',
                  price: '3 990 ₽ / год',
                  description: 'Экономия 33%! Доступ на 12 месяцев.',
                  popular: selectedPlan == SubscriptionPlan.yearly
                      ? true
                      : false,
                  onSelect: () {
                    subscriptionBloc.add(SelectPlan(SubscriptionPlan.yearly));

                    // TODO: сохранить выбор
                  },
                ),
                const SizedBox(height: 40),

                // Кнопка "Продолжить"
                BlocSelector<
                  SubscriptionBloc,
                  SubscriptionState,
                  SubscriptionPlan?
                >(
                  selector: (state) {
                    return state.selectedPlan;
                  },
                  builder: (context, plan) {
                    return ElevatedButton(
                      onPressed: () {
                        // Перейти к оплате (например, на экран /checkout)

                        subscriptionBloc.add(SavePlan());

                        plan == null
                            ? context.go('/home')
                            : context.go(
                                '/subscriptionSuccess',
                              ); // если используете go_router
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4CAF50),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Продолжить',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Вспомогательный виджет для варианта подписки
class _SubscriptionTile extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final bool popular;
  final VoidCallback onSelect;

  const _SubscriptionTile({
    required this.title,
    required this.price,
    required this.description,
    this.popular = false,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: popular ? Colors.blue.shade50 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: popular ? Color(0xFF4CAF50) : Colors.transparent,
            width: popular ? 2 : 0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                if (popular)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'ПОПУЛЯРНО',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
