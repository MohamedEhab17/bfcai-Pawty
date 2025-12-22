part of 'profile_setup_cubit.dart';

sealed class ProfileSetupState {}

final class ProfileSetupInitial extends ProfileSetupState {}

final class ProfileSetupLoading extends ProfileSetupState {}

final class ProfileSetupSuccess extends ProfileSetupState {}

final class ProfileSetupError extends ProfileSetupState {
  final String message;
  ProfileSetupError({required this.message});
}
