import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';

abstract class FavoriteRepositoryContract {
  Future<NetworkResult<List<PetModelDto>>> getFavorites();
  Future<NetworkResult<void>> addFavorite(PetModelDto pet);
  Future<NetworkResult<void>> removeFavorite(String petId);
}
