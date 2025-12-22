part of 'add_pet_cubit.dart';

sealed class AddPetState {
  const AddPetState();
}

final class AddPetInitial extends AddPetState {}

final class AddPetLoading extends AddPetState {}

final class AddPetSuccess extends AddPetState {}

final class AddPetError extends AddPetState {
  final String message;
  AddPetError({required this.message});
}

final class UploadImageLoading extends AddPetState {}

final class UploadImageSuccess extends AddPetState {
  final String url;
  UploadImageSuccess(this.url);
}

final class UploadImageError extends AddPetState {
  final String message;
  UploadImageError({required this.message});
}
