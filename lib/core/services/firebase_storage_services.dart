import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  FirebaseStorageService._();
  static final instance = FirebaseStorageService._();

  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Upload file and return download url
  Future<String> uploadImage({
    required File file,
    required String path,
    String? fileName,
  }) async {
    try {
      final String finalFileName =
          fileName ?? DateTime.now().millisecondsSinceEpoch.toString();

      final ref = _storage.ref().child('$path/$finalFileName');

      final uploadTask = await ref.putFile(file);

      final url = await uploadTask.ref.getDownloadURL();

      return url;
    } catch (e) {
      throw Exception('Upload image failed: $e');
    }
  }
}
