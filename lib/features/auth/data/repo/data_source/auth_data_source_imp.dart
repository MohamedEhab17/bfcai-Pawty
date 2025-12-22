import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/auth/data/auth_services/auth_firebase.dart';
import 'package:pawty/features/auth/data/models/request/login_request_dto.dart';
import 'package:pawty/features/auth/data/models/request/register_request_dto.dart';
import 'package:pawty/features/auth/data/models/request/user_model_dto.dart';
import 'package:pawty/features/auth/data/repo/data_source/auth_data_source_contract.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSourceContract {
  AuthRemoteDataSourceImp(this._authFirebase);
  final AuthFirebase _authFirebase;

  @override
  Future<NetworkResult<void>> register(
    RegisterRequestDto registerRequestDto,
  ) => _authFirebase.register(registerRequestDto);

  @override
  Future<NetworkResult<void>> login(LoginRequestDto loginRequestDto) =>
      _authFirebase.login(loginRequestDto);

  @override
  Future<NetworkResult<void>> addUser(UserModelDto userModelDto) =>
      _authFirebase.addUser(userModelDto);

  @override
  Future<NetworkResult<void>> updateUserProfile(UserModelDto updatedUser) =>
      _authFirebase.updateUserProfile(updatedUser);
}


AuthRemoteDataSourceContract authRemoteInjectable() =>
    AuthRemoteDataSourceImp(AuthFirebase.instance);
