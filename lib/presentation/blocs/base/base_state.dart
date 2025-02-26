import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  final bool isLoading;
  final String? errorMessage;

  const BaseState({this.isLoading = false, this.errorMessage});

  @override
  List<Object?> get props => [isLoading, errorMessage];
}

class BaseInitial extends BaseState {}

class BaseLoading extends BaseState {
  const BaseLoading() : super(isLoading: true);
}

class BaseError extends BaseState {
  const BaseError(String error) : super(errorMessage: error);
}

class BaseLoaded extends BaseState {
  const BaseLoaded();
}
