import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/auth/data/models/request/user_model_dto.dart';
import 'package:pawty/features/profile/data/profile_services/profile_firebase.dart';
import 'package:pawty/features/profile/data/repo/data_source/profile_remote_data_source_contract.dart';

class ProfileRemoteDataSourceImp implements ProfileRemoteDataSourceContract {
  ProfileRemoteDataSourceImp(this._profileFirebase);
  final ProfileFirebase _profileFirebase;

  @override
  Future<NetworkResult<UserModelDto>> getProfile() async {
    return await _profileFirebase.getProfile();
  }

  @override
  Future<NetworkResult<void>> logOut() async {
    return await _profileFirebase.logOut();
  }
}

ProfileRemoteDataSourceContract profileRemoteDataSourceInjectable() =>
    ProfileRemoteDataSourceImp(ProfileFirebase.instance);
