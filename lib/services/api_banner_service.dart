import 'package:http/http.dart' as http;
import '../models/banner.dart';
import 'api_url.dart';
import 'dart:convert';

class ApiVideoServices {
  Future<List<Banner>> fetchBanner() {
    return http
        .get(Uri.parse('${URL().API_URL}/api/v1/banner'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final bannerListContainer = _decoder.convert(jsonBody);
      final List banners = bannerListContainer['data'];
      return banners
          .map((contactRaw) => new Banner.fromJson(contactRaw))
          .toList();
    });
  }
}
