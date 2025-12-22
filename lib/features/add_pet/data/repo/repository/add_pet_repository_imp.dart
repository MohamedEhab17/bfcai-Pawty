import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/add_pet/data/repo/data_source/add_pet_data_source_contract.dart';
import 'package:pawty/features/add_pet/data/repo/data_source/add_pet_data_source_imp.dart';
import 'package:pawty/features/add_pet/data/repo/repository/add_pet_repository_contract.dart';

class AddPetRepositoryImp implements AddPetRepositoryContract {
  const AddPetRepositoryImp(this._addPetDataSourceContract);
  final AddPetDataSourceContract _addPetDataSourceContract;

  @override
  Future<NetworkResult<void>> addPet(PetModelDto petModelDto) =>
      _addPetDataSourceContract.addPet(petModelDto);
}

AddPetRepositoryContract addPetRepositoryInjectable() =>
    AddPetRepositoryImp(addPetDataSourceInjectable());
