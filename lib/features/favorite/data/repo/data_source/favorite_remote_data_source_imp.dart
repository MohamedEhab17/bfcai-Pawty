import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/favorite/data/favorite_services/favorite_firebase.dart';
import 'package:pawty/features/favorite/data/repo/data_source/favorite_remote_data_source_contract.dart';

class FavoriteRemoteDataSourceImp implements FavoriteRemoteDataSourceContract {
  FavoriteRemoteDataSourceImp(this._favoriteFirebase);
  final FavoriteFirebase _favoriteFirebase;

  @override
  Future<NetworkResult<List<PetModelDto>>> getFavorites() =>
      _favoriteFirebase.getFavorites();

  @override
  Future<NetworkResult<void>> addFavorite(PetModelDto pet) =>
      _favoriteFirebase.addFavorite(pet);

  @override
  Future<NetworkResult<void>> removeFavorite(String petId) =>
      _favoriteFirebase.removeFavorite(petId);
}

FavoriteRemoteDataSourceContract favoriteRemoteDataSourceInjectable() =>
    FavoriteRemoteDataSourceImp(FavoriteFirebase.instance);
