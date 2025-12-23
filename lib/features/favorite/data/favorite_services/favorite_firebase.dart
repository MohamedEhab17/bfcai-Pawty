import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';

class FavoriteFirebase {
  FavoriteFirebase._();
  static FavoriteFirebase? _instance;
  static FavoriteFirebase get instance => _instance ??= FavoriteFirebase._();

  CollectionReference<PetModelDto> getFavoritesCollection() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .withConverter<PetModelDto>(
          fromFirestore: (snapshot, _) =>
              PetModelDto.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  Future<NetworkResult<void>> addFavorite(PetModelDto pet) async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        return NetworkError(message: "User not logged in");
      }
      if (pet.id == null) {
        return NetworkError(message: "Invalid pet ID");
      }
      await getFavoritesCollection().doc(pet.id).set(pet);
      return NetworkSuccess(data: null);
    } catch (e) {
      return NetworkError(message: e.toString());
    }
  }

  Future<NetworkResult<void>> removeFavorite(String petId) async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        return NetworkError(message: "User not logged in");
      }
      await getFavoritesCollection().doc(petId).delete();
      return NetworkSuccess(data: null);
    } catch (e) {
      return NetworkError(message: e.toString());
    }
  }

  Future<NetworkResult<List<PetModelDto>>> getFavorites() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        return NetworkError(message: "User not logged in");
      }
      final querySnapshot = await getFavoritesCollection().get();
      final pets = querySnapshot.docs.map((e) => e.data()).toList();
      return NetworkSuccess(data: pets);
    } catch (e) {
      return NetworkError(message: e.toString());
    }
  }
}
