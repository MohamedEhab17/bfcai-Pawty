import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/add_pet_service.dart/add_pet_firebase.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/add_pet/data/repo/data_source/add_pet_data_source_contract.dart';

class AddPetDataSourceImp implements AddPetDataSourceContract {
  AddPetDataSourceImp(this._addPetFirebase);
  final AddPetFirebase _addPetFirebase;

  @override
  Future<NetworkResult<void>> addPet(PetModelDto petModelDto) =>
      _addPetFirebase.addPet(petModelDto);
}

AddPetDataSourceContract addPetDataSourceInjectable() =>
    AddPetDataSourceImp(AddPetFirebase.instance);
