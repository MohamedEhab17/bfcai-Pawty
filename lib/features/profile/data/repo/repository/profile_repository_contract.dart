import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/auth/data/models/request/user_model_dto.dart';

abstract class ProfileRepositoryContract {
  Future<NetworkResult<UserModelDto>> getProfile();
  Future<NetworkResult<void>> logOut();
}
