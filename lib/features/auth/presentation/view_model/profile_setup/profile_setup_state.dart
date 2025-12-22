part of 'profile_setup_cubit.dart';

sealed class ProfileSetupState {}

final class ProfileSetupInitial extends ProfileSetupState {}

final class UserAddedLoading extends ProfileSetupState {}

final class UserAddedSuccess extends ProfileSetupState {}

final class UserAddedFailure extends ProfileSetupState {
  final String message;
  UserAddedFailure({required this.message});
}
final class UserUpdatedLoading extends ProfileSetupState {}

final class UserUpdatedSuccess extends ProfileSetupState {}

final class UserUpdatedFailure extends ProfileSetupState {
  final String message;
  UserUpdatedFailure({required this.message});
}
final class UploadImageLoading extends ProfileSetupState {}
final class UploadImageSuccess extends ProfileSetupState {
  final String url;
  UploadImageSuccess(this.url);
}
final class UploadImageError extends ProfileSetupState {
  final String message;
  UploadImageError(this.message);
}