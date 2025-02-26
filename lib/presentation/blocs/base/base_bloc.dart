import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/blocs/base/base_event.dart';
import 'package:movie_app/presentation/blocs/base/base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(BaseInitial()) {
    on<StartLoading>((event, emit) => emit(const BaseLoading()));
    on<StopLoading>((event, emit) => emit(const BaseLoaded()));
    on<SetError>((event, emit) => emit(BaseError(event.error)));
  }
}
