part of 'favorite_cubit.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final List<PetModelDto> favorites;
  FavoriteSuccess(this.favorites);
}

final class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError(this.message);
}
