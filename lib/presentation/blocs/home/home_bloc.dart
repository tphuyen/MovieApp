import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:movie_app/presentation/blocs/home/home_event.dart';
import 'package:movie_app/presentation/blocs/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  HomeBloc() : super(const HomeState(selectedIndex: 0, isConnected: true)) {
    on<UpdateIndex>(_onUpdateIndex);
    on<CheckInternetOnStart>(_onCheckInternetOnStart);
    on<UpdateConnectionStatus>(_onUpdateConnectionStatus);

    add(CheckInternetOnStart());
    _listenToConnectivityChanges();
  }

  void _onUpdateIndex(UpdateIndex event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedIndex: event.newIndex));
  }

  Future<void> _onCheckInternetOnStart(
      CheckInternetOnStart event, Emitter<HomeState> emit) async {
    final connectivityResult = await _connectivity.checkConnectivity();
    bool isConnected = !connectivityResult.contains(ConnectivityResult.none);
    emit(state.copyWith(isConnected: isConnected));
  }

  void _onUpdateConnectionStatus(
      UpdateConnectionStatus event, Emitter<HomeState> emit) {
    emit(state.copyWith(isConnected: event.isConnected));
  }

  void _listenToConnectivityChanges() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
          (List<ConnectivityResult> result) {
        bool isConnected = !result.contains(ConnectivityResult.none);
        add(UpdateConnectionStatus(isConnected));
      },
    );
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
