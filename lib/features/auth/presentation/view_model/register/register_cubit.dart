import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/auth/data/models/request/register_request_dto.dart';
import 'package:pawty/features/auth/data/repo/repository/auth_repository_contract.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._repositoryContract) : super(RegisterInitial());
  final AuthRepositoryContract _repositoryContract;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    final request = RegisterRequestDto(
      email: email,
      password: password,
    );
    var result = await _repositoryContract.register(request);
    switch (result) {
      case NetworkSuccess<void>():
        emit(RegisterSuccess());
      case NetworkError<void>():
        emit(RegisterError());
    }
  }
}
