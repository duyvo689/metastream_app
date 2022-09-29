import 'package:app_metastream/models/upload_model.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class ApiUploadServices {
  Future<UploadImage?> getSignUrl(
    String fileName,
    String path,
    String fileExtension,
  ) async {
    return await http
        .post(
      Uri.parse('${URL().API_URL}/api/v1/upload'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'fileName': fileName,
        'path': path,
        'fileExtension': fileExtension,
      }),
    )
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;
      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }
      final JsonDecoder _decoder = new JsonDecoder();
      final uploadListContainer = _decoder.convert(jsonBody);
      final urlImage = uploadListContainer['url'];
      if (urlImage == null) {
        return null;
      } else {
        return UploadImage(url: urlImage);
      }
    });
  }

  Future<void> uploadImageAws(
    String url,
    PickedFile image,
    String fileExtension,
  ) async {
    Uint8List bytes = await image.readAsBytes();
    var response = await http.put(Uri.parse(url),
        headers: <String, String>{
          "Content-Type": fileExtension,
          "Access-Control-Allow-Origin": "*",
        },
        body: bytes);
  }
}
