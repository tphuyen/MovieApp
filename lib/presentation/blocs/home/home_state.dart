import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final bool isConnected;

  const HomeState({
    required this.selectedIndex,
    required this.isConnected,
  });

  HomeState copyWith({int? selectedIndex, bool? isConnected}) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object> get props => [selectedIndex, isConnected];
}
