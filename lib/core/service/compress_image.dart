import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter_image_compress/flutter_image_compress.dart';

class CompressImage {
  Future<Uint8List?> compressImageToBytes(File file) async {
    int quality = 80;
    Uint8List originalBytes = await file.readAsBytes();
    Uint8List? compressed;

    while (quality >= 10) {
      compressed = await FlutterImageCompress.compressWithList(
        originalBytes,
        quality: quality,
        format: CompressFormat.jpeg, // pastikan JPEG
        keepExif: true,
      );

      if (compressed.length <= 100 * 1024) {
        print(
          'Berhasil compress ke ${compressed.length / 1024} KB di quality $quality',
        );
        break;
      }

      quality -= 10;
      print("=====> $quality");
    }

    return compressed;
  }

  Future<String?> compressImageToBase64(File file) async {
    final image = await compressImageToBytes(file);
    if (image != null) {
      final String base64String = base64Encode(image);
      return base64String;
    }
    return null;
  }
}
