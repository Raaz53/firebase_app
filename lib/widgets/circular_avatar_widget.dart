import 'package:firebasework/resources/font_structure.dart';
import 'package:firebasework/services/firebase_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class CircularAvatarWidget extends StatefulWidget {
  CircularAvatarWidget({super.key, this.radius, this.uploadedImage});

  final Function(String?)? uploadedImage;

  final double? radius;

  @override
  State<CircularAvatarWidget> createState() => _CircularAvatarWidgetState();
}

class _CircularAvatarWidgetState extends State<CircularAvatarWidget> {
  late XFile? cameraPhoto;
  late XFile? galleryImage;
  ImagePicker imagePicker = ImagePicker();

  onClicked() async {
    final data = showModalBottomSheet<String>(
        context: context,
        backgroundColor: Colors.grey,
        builder: (c) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () async {
                    cameraPhoto =
                        await imagePicker.pickImage(source: ImageSource.camera);
                    if (cameraPhoto != null) {
                      String? imageUrl = FirebaseImage.uploadPic(cameraPhoto);
                      Navigator.of(context).pop(imageUrl);
                    }
                  },
                  splashColor: Colors.transparent,
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'Camera',
                        style: FontStructure.bodyText2,
                      ),
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () async {
                    galleryImage = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (galleryImage != null) {
                      String imageUrl = FirebaseImage.uploadPic(cameraPhoto);
                      Navigator.pop(context, imageUrl);
                    }
                  },
                  splashColor: Colors.transparent,
                  child: ListTile(
                      title: Center(
                    child: Text(
                      'Gallery',
                      style: FontStructure.bodyText2,
                    ),
                  )),
                ),
              ],
            ));
    widget.uploadedImage!(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: CircleAvatar(
        radius: widget.radius ?? 50,
        backgroundImage: const NetworkImage(
            'https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8'),
      ),
    );
  }
}
