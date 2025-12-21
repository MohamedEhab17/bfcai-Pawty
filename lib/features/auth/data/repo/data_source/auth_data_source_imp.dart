import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/auth/data/auth_services/auth_firebase.dart';
import 'package:pawty/features/auth/data/models/request/login_request_dto.dart';
import 'package:pawty/features/auth/data/models/request/register_request_dto.dart';
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
}


AuthRemoteDataSourceContract authRemoteInjectable() =>
    AuthRemoteDataSourceImp(AuthFirebase.instance);
