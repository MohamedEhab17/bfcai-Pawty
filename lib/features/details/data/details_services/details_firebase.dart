import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';

class DetailsFirebase {
  DetailsFirebase._();
  static DetailsFirebase? _instance;
  static DetailsFirebase get instance => _instance ??= DetailsFirebase._();

  CollectionReference<PetModelDto> getPetsCollection() {
    return FirebaseFirestore.instance
        .collection('pets')
        .withConverter<PetModelDto>(
          fromFirestore: (snapshot, _) =>
              PetModelDto.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  Future<NetworkResult<PetModelDto>> getPetDetails(String id) async {
    try {
      final docSnap = await getPetsCollection().doc(id).get();
      if (docSnap.exists) {
        return NetworkSuccess(data: docSnap.data());
      } else {
        return NetworkError(message: "Pet not found");
      }
    } catch (e) {
      return NetworkError(message: e.toString());
    }
  }
}
