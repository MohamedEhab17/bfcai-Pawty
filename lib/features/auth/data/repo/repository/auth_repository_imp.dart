import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/auth/data/models/request/login_request_dto.dart';
import 'package:pawty/features/auth/data/models/request/register_request_dto.dart';
import 'package:pawty/features/auth/data/repo/data_source/auth_data_source_contract.dart';
import 'package:pawty/features/auth/data/repo/data_source/auth_data_source_imp.dart';
import 'package:pawty/features/auth/data/repo/repository/auth_repository_contract.dart';

class AuthRepositoryImp implements AuthRepositoryContract {
  const AuthRepositoryImp(this._authRemoteDataSourceContract);
  final AuthRemoteDataSourceContract _authRemoteDataSourceContract;
  @override
  Future<NetworkResult<void>> register(
    RegisterRequestDto registerRequestDto,
  ) => _authRemoteDataSourceContract.register(registerRequestDto);

  @override
  Future<NetworkResult<void>> login(LoginRequestDto loginRequestDto) =>
      _authRemoteDataSourceContract.login(loginRequestDto);
   

}

AuthRepositoryContract repositoryInjectable() => AuthRepositoryImp(authRemoteInjectable());
