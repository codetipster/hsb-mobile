import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imageControllerProvider = ChangeNotifierProvider<ImageController>((ref) {
  return ImageController();
});

class ImageController extends ChangeNotifier {
  File? image;

  Future pickImage({ImageSource imageSource = ImageSource.camera}) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
      notifyListeners();
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }
}
