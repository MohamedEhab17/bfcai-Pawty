import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawty/core/helper/pick_image_helper.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/core/services/firebase_storage_services.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/add_pet/data/repo/repository/add_pet_repository_contract.dart';
part 'add_pet_state.dart';

class AddPetCubit extends Cubit<AddPetState> {
  AddPetCubit(this._repositoryContract) : super(AddPetInitial());
  final AddPetRepositoryContract _repositoryContract;

  void addPet(PetModelDto petModelDto) async {
    emit(AddPetLoading());
    var result = await _repositoryContract.addPet(petModelDto);
    switch (result) {
      case NetworkSuccess<void>():
        emit(AddPetSuccess());
      case NetworkError<void>(message: final message):
        emit(AddPetError(message: message));
    }
  }

  Future<void> uploadPetImage() async {
    emit(UploadImageLoading());

    try {
      final file = await ImagePickerHelper.pickFromGallery();
      if (file == null) return;

      final url = await FirebaseStorageService.instance.uploadImage(
        file: file,
        path: 'pets/${FirebaseAuth.instance.currentUser!.uid}/pe',
      );

      emit(UploadImageSuccess(url));
    } catch (e) {
      emit(UploadImageError(message: e.toString()));
    }
  }
}
