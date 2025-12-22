import 'package:bloc/bloc.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/auth/data/models/request/user_model_dto.dart';
import 'package:pawty/features/auth/data/repo/repository/auth_repository_contract.dart';
part 'profile_setup_state.dart';

class ProfileSetupCubit extends Cubit<ProfileSetupState> {
  ProfileSetupCubit(this._repositoryContract) : super(ProfileSetupInitial());
  final AuthRepositoryContract _repositoryContract;

  Future<void> addUser({
    
    String? country,
    String? dateOfBirth,
    String? gender,
    String? imageUrl,
    String? userName,
  }) async {
    emit(ProfileSetupLoading());
    final request = UserModelDto(
      country: country,
      dateOfBirth: dateOfBirth,
      gender: gender,
      imageUrl: imageUrl,
      userName: userName,
    );
    var result = await _repositoryContract.addUser(request);
    switch (result) {
      case NetworkSuccess<void>():
        emit(ProfileSetupSuccess());
      case NetworkError<void>(message: final message):
        emit(ProfileSetupError(message: message));
    }
  }
}
