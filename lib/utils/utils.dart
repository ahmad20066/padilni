import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import "package:http/http.dart" as http;

class Utils {
  static Future<File> fileFromUrl(String path) async {
    final url = Uri.parse(path);
    final http.Response responseData = await http.get(url);
    Uint8List uint8list = responseData.bodyBytes;
    var buffer = uint8list.buffer;
    ByteData byteData = ByteData.view(buffer);
    var tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/${path.split("/").last}')
        .writeAsBytes(
            buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }
}
