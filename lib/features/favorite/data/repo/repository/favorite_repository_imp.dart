import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/favorite/data/repo/data_source/favorite_remote_data_source_contract.dart';
import 'package:pawty/features/favorite/data/repo/data_source/favorite_remote_data_source_imp.dart';
import 'package:pawty/features/favorite/data/repo/repository/favorite_repository_contract.dart';

class FavoriteRepositoryImp implements FavoriteRepositoryContract {
  final FavoriteRemoteDataSourceContract _remoteDataSource;

  FavoriteRepositoryImp(this._remoteDataSource);

  @override
  Future<NetworkResult<List<PetModelDto>>> getFavorites() =>
      _remoteDataSource.getFavorites();

  @override
  Future<NetworkResult<void>> addFavorite(PetModelDto pet) =>
      _remoteDataSource.addFavorite(pet);

  @override
  Future<NetworkResult<void>> removeFavorite(String petId) =>
      _remoteDataSource.removeFavorite(petId);
}

FavoriteRepositoryContract favoriteRepositoryInjectable() =>
    FavoriteRepositoryImp(favoriteRemoteDataSourceInjectable());
