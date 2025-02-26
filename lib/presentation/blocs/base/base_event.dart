import 'package:equatable/equatable.dart';

abstract class BaseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartLoading extends BaseEvent {}

class StopLoading extends BaseEvent {}

class SetError extends BaseEvent {
  final String error;
  SetError(this.error);

  @override
  List<Object?> get props => [error];
}
