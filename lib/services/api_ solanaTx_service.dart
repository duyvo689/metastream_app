import 'package:app_metastream/models/models.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';
import 'dart:convert';

class ApiSolanaTxServices {
  Future<List<SolanaTx>> fetchSolanaTx(String mintAddress) async {
    return await http
        .get(Uri.parse('${URL().API_URL}/api/v1/solTx/${mintAddress}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final solanaTxListContainer = _decoder.convert(jsonBody);
      List solanaTx = solanaTxListContainer['data'];
      return solanaTx
          .map((contactRaw) => new SolanaTx.fromJson(contactRaw))
          .toList();
    });
  }
}
