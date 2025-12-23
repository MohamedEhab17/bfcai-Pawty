part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<PetModelDto> pets;
  HomeSuccess(this.pets);
}

final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
