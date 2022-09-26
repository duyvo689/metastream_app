import 'package:app_metastream/models/models.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';
import 'dart:convert';

class ApiBannerServices {
  Future<List<Carousel>> fetchBanner() async {
    return await http
        .get(Uri.parse('${URL().API_URL}/api/v1/banner'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final bannerListContainer = _decoder.convert(jsonBody);
      List banners = bannerListContainer['data'];
      return banners
          .map((contactRaw) => new Carousel.fromJson(contactRaw))
          .toList();
    });
  }
}
