import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:quizzo/widgets/animate_loading.dart';

class CamaraController extends GetxController {
  /// Captures an image from the camera, compresses it, and returns the compressed file.
  Future<File?> captureAndCompressImage(BuildContext context) async {
    try {
      AnimateLoading().showLoading(context);
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image == null) {
        log("No image captured");
        Navigator.pop(context);
        return null;
      }

      final Directory dir = await getApplicationDocumentsDirectory();
      final String targetPath = p.join(
        dir.path,
        "${p.basenameWithoutExtension(image.path)}_compressed${p.extension(image.path)}",
      );

      final File? compressedFile = await _compressImage(
        File(image.path),
        targetPath,
        p.extension(image.path),
      );

      Navigator.pop(context);

      if (compressedFile == null) {
        log("Compression failed for image: ${image.path}");

        return null;
      }

      log("Compressed image saved to: ${compressedFile.path}");
      return compressedFile;
    } catch (err) {
      log("Error capturing or compressing image: $err");
      Navigator.pop(context);
      return null;
    }
  }

  // getImage from gallery and take to compressed image

  Future<File?> getImageFromGalleryAndCompress(BuildContext context) async {
    try {
      // AnimateLoading().showLoading(context);
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        log("No image selected");
        Navigator.pop(context);
        return null;
      }

      final Directory dir = await getApplicationDocumentsDirectory();
      final String targetPath = p.join(
        dir.path,
        "${p.basenameWithoutExtension(image.path)}_compressed${p.extension(image.path)}",
      );

      final File? compressedFile = await _compressImage(
        File(image.path),
        targetPath,
        p.extension(image.path),
      );
      Navigator.pop(context);
      if (compressedFile == null) {
        log("Compression failed for image: ${image.path}");
        return null;
      }
      log("Compressed image saved to: ${compressedFile.path}");
      return compressedFile;
    } catch (err) {
      log("Error capturing or compressing image: $err");
      Navigator.pop(context);
      return null;
    }
  }

  Future<File?> _compressImage(File file, String targetPath, String fileType,
      {int quality = 50}) async {
    try {
      CompressFormat format;
      switch (fileType.toLowerCase()) {
        case ".jpg":
        case ".jpeg":
          format = CompressFormat.jpeg;
          break;
        case ".png":
          format = CompressFormat.png;
          break;
        default:
          log("Unsupported file type: $fileType");
          return file;
      }

      final XFile? result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: quality,
        autoCorrectionAngle: true,
        format: format,
      );

      if (result == null) {
        log("Compression failed for file: ${file.path}");
        return null;
      }

      log("Compressed image saved to: ${result.path}");
      return File(result.path);
    } catch (e) {
      log("Error compressing image: $e");
      return null;
    }
  }
}
