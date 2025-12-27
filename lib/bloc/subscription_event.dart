part of 'subscription_bloc.dart';

abstract class SubscriptionEvent extends Equatable {
  const SubscriptionEvent();
}

class SelectPlan extends SubscriptionEvent {
  final SubscriptionPlan plan;
  const SelectPlan(this.plan);
  @override
  List<Object> get props => [plan];
}

class LoadPlan extends SubscriptionEvent {
  @override
  List<Object> get props => [];
}

class SavePlan extends SubscriptionEvent {
  @override
  List<Object> get props => [];
}
