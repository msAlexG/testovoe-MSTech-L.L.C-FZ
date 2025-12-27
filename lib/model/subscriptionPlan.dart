// lib/models/subscription_plan.dart
enum SubscriptionPlan {
  monthly,
  yearly;

  String get label {
    switch (this) {
      case SubscriptionPlan.monthly:
        return 'месячная подписка';
      case SubscriptionPlan.yearly:
        return 'годовая подписка';
    }
  }

  String get price {
    switch (this) {
      case SubscriptionPlan.monthly:
        return '499 ₽ / месяц';
      case SubscriptionPlan.yearly:
        return '3 990 ₽ / год';
    }
  }

  String get description {
    switch (this) {
      case SubscriptionPlan.monthly:
        return 'Полный доступ на 30 дней. Отмена в любой момент.';
      case SubscriptionPlan.yearly:
        return 'Экономия 33%! Доступ на 12 месяцев.';
    }
  }

  String toJson() => name;
  static SubscriptionPlan fromJson(String name) =>
      SubscriptionPlan.values.byName(name);
}
