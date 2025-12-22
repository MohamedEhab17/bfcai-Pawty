import 'package:bloc/bloc.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/auth/data/models/request/login_request_dto.dart';
import 'package:pawty/features/auth/data/repo/repository/auth_repository_contract.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repositoryContract) : super(LoginInitial());
  final AuthRepositoryContract _repositoryContract;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final request = LoginRequestDto(email: email, password: password);
    var result = await _repositoryContract.login(request);
    switch (result) {
      case NetworkSuccess<void>():
        emit(LoginSuccess());
      case NetworkError<void>(message: final message):
        emit(LoginError(message: message));
    }
  }
}
