import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/home/data/repo/data_source/home_remote_data_source_contract.dart';
import 'package:pawty/features/home/data/repo/data_source/home_remote_data_source_imp.dart';
import 'package:pawty/features/home/data/repo/repository/home_repository_contract.dart';

class HomeRepositoryImp implements HomeRepositoryContract {
  final HomeRemoteDataSourceContract _remoteDataSource;

  HomeRepositoryImp(this._remoteDataSource);

  @override
  Future<NetworkResult<List<PetModelDto>>> getPets({String? category}) =>
      _remoteDataSource.getPets(category: category);
}

HomeRepositoryContract homeRepositoryInjectable() =>
    HomeRepositoryImp(homeRemoteDataSourceInjectable());
