import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF424242), // Тёмно-серый фон
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Заголовок
              const Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'Добро пожаловать в приложение для составления строительных смет',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Карточки шагов
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStepCard(
                      context,
                      number: '1',
                      icon: Icons.calculate,
                      title: 'Шаг 1: Введите данные о строительных работах',
                    ),
                    _buildStepCard(
                      context,
                      number: '2',
                      icon: Icons.article_outlined,
                      title: 'Шаг 2: Выберите материалы и цены',
                    ),
                    _buildStepCard(
                      context,
                      number: '3',
                      icon: Icons.checklist,
                      title: 'Шаг 3: Сгенерируйте детальную смету',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              // Кнопка "Начать"
              SizedBox(
                width: 280,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/paywallScreen');
                    // Здесь можно перейти на следующий экран
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF4CAF50,
                    ), // Голубой цвет из картинки
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                    shadowColor: Colors.black.withOpacity(0.2),
                  ),
                  child: const Text(
                    'Продолжить',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard(
    BuildContext context, {
    required String number,
    required IconData icon,
    required String title,
  }) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Номер шага
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF64B5F6), // Голубой круг
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Иконка
          // Icon(
          //   icon,
          //   size: 70,
          //   color: const Color(0xFF2196F3), // Синий цвет иконки
          // ),
          // const SizedBox(height: 20),

          // Описание
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,

              fontWeight: FontWeight.w500,
              color: Color(0xFF212121),
            ),
          ),
        ],
      ),
    );
  }
}
