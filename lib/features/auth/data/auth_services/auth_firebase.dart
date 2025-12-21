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
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
      return NetworkError(e.toString());
    } catch (e) {
      return NetworkError(e.toString());
    }
  }

   Future<NetworkResult<void>> register(RegisterRequestDto registerRequest) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerRequest.email!,
        password: registerRequest.password!,
      );
      return NetworkSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
       return NetworkError(e.toString());
    } catch (e) {
     return NetworkError(e.toString());
    }
  }
}
