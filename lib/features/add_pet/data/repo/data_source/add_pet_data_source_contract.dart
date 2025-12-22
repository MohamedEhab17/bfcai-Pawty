
import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';

abstract class AddPetDataSourceContract {
  Future<NetworkResult<void>> addPet(PetModelDto petModelDto);
}
