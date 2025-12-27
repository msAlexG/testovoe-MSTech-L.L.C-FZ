part of 'subscription_bloc.dart';

class SubscriptionState extends Equatable {
  final SubscriptionPlan? selectedPlan;

  const SubscriptionState({this.selectedPlan});

  @override
  List<Object?> get props => [selectedPlan];

  factory SubscriptionState.initial() =>
      const SubscriptionState(selectedPlan: null);

  SubscriptionState copyWith({SubscriptionPlan? selectedPlan}) {
    return SubscriptionState(selectedPlan: selectedPlan ?? this.selectedPlan);
  }
}
