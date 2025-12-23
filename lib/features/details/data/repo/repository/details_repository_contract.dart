import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';

abstract class DetailsRepositoryContract {
  Future<NetworkResult<PetModelDto>> getPetDetails(String id);
}
