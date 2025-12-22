import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawty/core/helper/pick_image_helper.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/core/services/firebase_storage_services.dart';
import 'package:pawty/features/auth/data/models/request/user_model_dto.dart';
import 'package:pawty/features/auth/data/repo/repository/auth_repository_contract.dart';
part 'profile_setup_state.dart';

class ProfileSetupCubit extends Cubit<ProfileSetupState> {
  ProfileSetupCubit(this._repositoryContract) : super(ProfileSetupInitial());
  final AuthRepositoryContract _repositoryContract;

  Future<void> addUser({required UserModelDto userModelDto}) async {
    emit(UserAddedLoading());
    var result = await _repositoryContract.addUser(userModelDto);
    switch (result) {
      case NetworkSuccess<void>():
        emit(UserAddedSuccess());
      case NetworkError<void>(message: final message):
        emit(UserAddedFailure(message: message));
    }
  }

  Future<void> updateUserProfile({required UserModelDto updatedUser}) async {
    emit(UserUpdatedLoading());
    var result = await _repositoryContract.updateUserProfile(updatedUser);
    switch (result) {
      case NetworkSuccess<void>():
        emit(UserUpdatedSuccess());
      case NetworkError<void>(message: final message):
        emit(UserUpdatedFailure(message: message));
    }
  }

  Future<void> uploadProfileImage() async {
    emit(UploadImageLoading());

    try {
      final file = await ImagePickerHelper.pickFromGallery();
      if (file == null) return;

      final url = await FirebaseStorageService.instance.uploadImage(
        file: file,
        path: 'users/${FirebaseAuth.instance.currentUser!.uid}/profile',
      );

      emit(UploadImageSuccess(url));
    } catch (e) {
      emit(UploadImageError(e.toString()));
    }
  }
}
