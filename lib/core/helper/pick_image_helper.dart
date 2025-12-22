import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickFromGallery() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    return File(image.path);
  }

  static Future<File?> pickFromCamera() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    return File(image.path);
  }
}
