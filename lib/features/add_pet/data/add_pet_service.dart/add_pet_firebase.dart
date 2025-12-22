import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';

class AddPetFirebase {
  AddPetFirebase._();
  static AddPetFirebase? _instance;
  static AddPetFirebase get instance => _instance ??= AddPetFirebase._();

  CollectionReference<PetModelDto> getPetsCollection() {
    return FirebaseFirestore.instance
        .collection('pets')
        .withConverter<PetModelDto>(
          fromFirestore: (snapshot, _) =>
              PetModelDto.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  Future<NetworkResult<void>> addPet(PetModelDto pet) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final petId = getPetsCollection().doc().id;
      pet.id = petId;
      pet.userId = userId;
      await getPetsCollection().doc(pet.id).set(pet);

      // .set(pet);
      return NetworkSuccess();
    } catch (e) {
      return NetworkError(message: e.toString());
    }
  }
}
