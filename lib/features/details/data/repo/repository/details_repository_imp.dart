import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/details/data/repo/data_source/details_remote_data_source_contract.dart';
import 'package:pawty/features/details/data/repo/data_source/details_remote_data_source_imp.dart';
import 'package:pawty/features/details/data/repo/repository/details_repository_contract.dart';

class DetailsRepositoryImp implements DetailsRepositoryContract {
  final DetailsRemoteDataSourceContract _remoteDataSource;

  DetailsRepositoryImp(this._remoteDataSource);

  @override
  Future<NetworkResult<PetModelDto>> getPetDetails(String id) =>
      _remoteDataSource.getPetDetails(id);
}

DetailsRepositoryContract detailsRepositoryInjectable() =>
    DetailsRepositoryImp(detailsRemoteDataSourceInjectable());
