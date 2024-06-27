import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseImage {
  // static Reference referenceRoot = FirebaseStorage.instance.ref();
  // static Reference referenceDirImages = referenceRoot.child('profile');

  static String imageUrl = '';

  static uploadPic(File? file) async {
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      if (file != null) {
        Reference ref =
            FirebaseStorage.instance.ref().child("images/$uniqueFileName");
        await ref.putFile(file);
        String url = (await ref.getDownloadURL()).toString();
        log('URL   L:${url}');

        return url;
      }
    } catch (e) {
      print('error in upload: $e');
    }
    return imageUrl;
  }
}
