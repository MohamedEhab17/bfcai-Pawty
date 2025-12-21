import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/auth/data/models/request/login_request_dto.dart';
import 'package:pawty/features/auth/data/models/request/register_request_dto.dart';

abstract class AuthRemoteDataSourceContract {
  Future<NetworkResult<void>> register(RegisterRequestDto registerRequestDto);
   Future<NetworkResult<void>> login(LoginRequestDto loginRequestDto);
}