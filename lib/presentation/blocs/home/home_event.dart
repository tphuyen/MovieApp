import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class UpdateIndex extends HomeEvent {
  final int newIndex;
  const UpdateIndex(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}

class CheckInternetOnStart extends HomeEvent {}

class UpdateConnectionStatus extends HomeEvent {
  final bool isConnected;
  const UpdateConnectionStatus(this.isConnected);

  @override
  List<Object> get props => [isConnected];
}
