import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/core/service/compress_image.dart';

void main() {
  test('CompressImage instantiation', () {
    final compressor = CompressImage();
    expect(compressor, isA<CompressImage>());
  });

  // Note: Untuk test compress real image perlu integration test dengan File access.
}