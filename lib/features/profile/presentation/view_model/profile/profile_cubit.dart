import 'package:bloc/bloc.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/auth/data/models/request/user_model_dto.dart';
import 'package:pawty/features/profile/data/repo/repository/profile_repository_contract.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepositoryContract _profileRepository;

  ProfileCubit(this._profileRepository) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final result = await _profileRepository.getProfile();
    if (isClosed) return;
    switch (result) {
      case NetworkSuccess<UserModelDto>(data: final user):
        emit(ProfileSuccess(user!));
      case NetworkError<UserModelDto>(message: final message):
        emit(ProfileError(message));
    }
  }

  Future<void> logOut() async {
    emit(ProfileLoading());
    final result = await _profileRepository.logOut();
    if (isClosed) return;
    switch (result) {
      case NetworkSuccess<void>():
        emit(ProfileLogoutSuccess());
      case NetworkError<void>(message: final message):
        emit(ProfileError(message));
    }
  }
}
