import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class ApiClient {
  static var dio = Dio();

  static Future<void> uploadFile(List<int> file, String fileName) async {
    FormData formData = FormData.fromMap({
      "folder": "returnsImages",
      "files": MultipartFile.fromBytes(
        file,
        filename: fileName,
        contentType: MediaType("image", "png"),
      )
    });

    final resp = await dio.post("https://app.trackbudi.com:3000/api/v1/customer/product/upload-images", data: formData);

    log(resp.data.toString());
  }
}
