import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/auth/data/models/request/user_model_dto.dart';

class ProfileFirebase {
  ProfileFirebase._();
  static ProfileFirebase? _instance;
  static ProfileFirebase get instance => _instance ??= ProfileFirebase._();

  CollectionReference<UserModelDto> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserModelDto>(
          fromFirestore: (snapshot, _) =>
              UserModelDto.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }
  Future<NetworkResult<UserModelDto>> getProfile() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        return NetworkError(message: "User not logged in");
      }
      final docSnap = await getUsersCollection().doc(uid).get();
      if (docSnap.exists) {
        return NetworkSuccess(data: docSnap.data());
      } else {
        return NetworkError(message: "User not found");
      }
    } catch (e) {
      return NetworkError(message: e.toString());
    }
  }

  Future<NetworkResult<void>> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return NetworkSuccess(data: null);
    } catch (e) {
      return NetworkError(message: e.toString());
    }
  }
}
