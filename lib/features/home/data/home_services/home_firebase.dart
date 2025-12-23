import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/auth/data/models/request/user_model_dto.dart';

class HomeFirebase {
  HomeFirebase._();
  static HomeFirebase? _instance;
  static HomeFirebase get instance => _instance ??= HomeFirebase._();

  CollectionReference<PetModelDto> getPetsCollection() {
    return FirebaseFirestore.instance
        .collection('pets')
        .withConverter<PetModelDto>(
          fromFirestore: (snapshot, _) =>
              PetModelDto.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  Future<NetworkResult<List<PetModelDto>>> getPets({String? category}) async {
    try {
      Query<PetModelDto> query = getPetsCollection();
      if (category != null && category != "All") {
        query = query.where('type', isEqualTo: category);
      }

      final querySnapshot = await query.get();
      final pets = querySnapshot.docs.map((e) => e.data()).toList();

      for (var pet in pets) {
        if (pet.userId != null) {
          final userSnap = await FirebaseFirestore.instance
              .collection('users')
              .withConverter<UserModelDto>(
                fromFirestore: (snapshot, _) =>
                    UserModelDto.fromJson(snapshot.data()!),
                toFirestore: (user, _) => user.toJson(),
              )
              .doc(pet.userId)
              .get();
          if (userSnap.exists) {
            pet.user = userSnap.data();
          }
        }
      }

      return NetworkSuccess(data: pets);
    } catch (e) {
      return NetworkError(message: e.toString());
    }
  }
}
