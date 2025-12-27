import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:onboarding/model/subscriptionPlan.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'subscription_event.dart';
part 'subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SubscriptionBloc() : super(SubscriptionState.initial()) {
    on<SelectPlan>(_onSelectPlan);
    on<LoadPlan>(_onLoadPlan);
    on<SavePlan>(_onSavePlan);
  }

  // Выбор подписки
  FutureOr<void> _onSelectPlan(
    SelectPlan event,
    Emitter<SubscriptionState> emit,
  ) async {
    emit(state.copyWith(selectedPlan: event.plan));
  }

  // Загрузка сохранённого выбора при старте
  FutureOr<void> _onLoadPlan(
    LoadPlan event,
    Emitter<SubscriptionState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final String? savedPlan = prefs.getString('selected_plan');

    switch (savedPlan) {
      case 'monthly':
        emit(state.copyWith(selectedPlan: SubscriptionPlan.monthly));
      case 'yearly':
        emit(state.copyWith(selectedPlan: SubscriptionPlan.yearly));
      case null:
        emit(state.copyWith(selectedPlan: null));
    }
  }

  // Сохранение подписки
  FutureOr<void> _onSavePlan(
    SavePlan event,
    Emitter<SubscriptionState> emit,
  ) async {
    final SubscriptionPlan? currentPlan = state.selectedPlan;

    if (currentPlan == null) {
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selected_plan', currentPlan.toJson());
    }
  }
}
