import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/auth/data/models/request/user_model_dto.dart';
import 'package:pawty/features/profile/data/repo/data_source/profile_remote_data_source_contract.dart';
import 'package:pawty/features/profile/data/repo/data_source/profile_remote_data_source_imp.dart';
import 'package:pawty/features/profile/data/repo/repository/profile_repository_contract.dart';

class ProfileRepositoryImp implements ProfileRepositoryContract {
  final ProfileRemoteDataSourceContract _remoteDataSource;

  ProfileRepositoryImp(this._remoteDataSource);

  @override
  Future<NetworkResult<UserModelDto>> getProfile() async {
    return await _remoteDataSource.getProfile();
  }

  @override
  Future<NetworkResult<void>> logOut() async {
    return await _remoteDataSource.logOut();
  }
}

ProfileRepositoryContract profileRepositoryInjectable() =>
    ProfileRepositoryImp(profileRemoteDataSourceInjectable());
