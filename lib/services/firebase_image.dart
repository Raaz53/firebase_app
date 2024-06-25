import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseImage {
  static Reference referenceRoot = FirebaseStorage.instance.ref();
  static Reference referenceDirImages = referenceRoot.child('profile');

  static String imageUrl = '';

  static uploadPic(XFile? file) async {
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    if (file != null) {
      try {
        Reference referenceImageToUpload =
            referenceDirImages.child(uniqueFileName);
        await referenceImageToUpload.putFile(File(file.path));
        imageUrl = await referenceDirImages.getDownloadURL();
      } catch (e) {
        print('Error: $e');
      }
    }
    return imageUrl;
  }
}
