import 'package:app_metastream/models/models.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';
import 'dart:convert';

class ApiEtherTxServices {
  Future<List<EtherTx>> fetchBanner(String nftAddress, String tokenId) async {
    return await http
        .get(Uri.parse(
            '${URL().API_URL}/api/v1/etherTx/${nftAddress}/${tokenId}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final etherTxListContainer = _decoder.convert(jsonBody);
      List etherTx = etherTxListContainer['data'];
      return etherTx
          .map((contactRaw) => new EtherTx.fromJson(contactRaw))
          .toList();
    });
  }
}
