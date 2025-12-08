part of 'bottom_nav_cubit.dart';

class BottomNavState  {
  final int index;
  final bool visible;

  const BottomNavState({required this.index, required this.visible});

  BottomNavState copyWith({int? index, bool? visible}) {
    return BottomNavState(
      index: index ?? this.index,
      visible: visible ?? this.visible,
    );
  }

  List<Object?> get props => [index, visible];
}
