import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/auth/data/models/request/login_request_dto.dart';
import 'package:pawty/features/auth/data/models/request/register_request_dto.dart';

class AuthFirebase {
  AuthFirebase._();
  static AuthFirebase? _instance;
  static AuthFirebase get instance => _instance ??= AuthFirebase._();
  Future<NetworkResult<void>> login(LoginRequestDto loginRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginRequest.email!,
        password: loginRequest.password!,
      );
      return NetworkSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return NetworkError(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return NetworkError(message: 'Wrong password provided for that user.');
      }
      return NetworkError(message: e.toString());
    } catch (e) {
      return NetworkError(message: e.toString());
    }
  }

  Future<NetworkResult<void>> register(
    RegisterRequestDto registerRequest,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerRequest.email!,
        password: registerRequest.password!,
      );
      return NetworkResult.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return NetworkResult.error(
          message: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        return NetworkResult.error(
          message: 'The account already exists for that email.',
        );
      }
      return NetworkResult.error(message: e.toString());
    } catch (e) {
      return NetworkResult.error(message: e.toString());
    }
  }
}
