import 'package:app_metastream/models/models.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';
import 'dart:convert';

class ApiNftSolanaServices {
  Future<List<NftSolana>> fetchSellerByAddress(String id) {
    return http
        .get(Uri.parse('${URL().API_URL}/api/v1/nftSolana/seller/${id}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final nftSolanaListContainer = _decoder.convert(jsonBody);
      final List nftSolanas = nftSolanaListContainer['data'];
      return nftSolanas
          .map((contactRaw) => new NftSolana.fromJson(contactRaw))
          .toList();
    });
  }

  Future<List<NftSolana>> fetchNftsSolanaByCollectionGame(String collection) {
    return http
        .get(Uri.parse(
            '${URL().API_URL}/api/v1/nftSolana/collection/${collection != '' ? collection : '123'}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final nftSolanaListContainer = _decoder.convert(jsonBody);
      final List nftSolanas = nftSolanaListContainer['data'];
      return nftSolanas
          .map((contactRaw) => new NftSolana.fromJson(contactRaw))
          .toList();
    });
  }
}
