part of 'details_cubit.dart';

sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsSuccess extends DetailsState {
  final PetModelDto pet;
  DetailsSuccess(this.pet);
}

final class DetailsError extends DetailsState {
  final String message;
  DetailsError(this.message);
}
