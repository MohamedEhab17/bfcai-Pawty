import 'package:flutter_bloc/flutter_bloc.dart';
part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(const BottomNavState(index: 0, visible: true));

  void setIndex(int i) => emit(state.copyWith(index: i, visible: true));

  void show() {
    if (!state.visible) emit(state.copyWith(visible: true));
  }

  void hide() {
    if (state.visible) emit(state.copyWith(visible: false));
  }
}
