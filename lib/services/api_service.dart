import 'package:http/http.dart' as http;
import '../models/game.dart';
import 'api_url.dart';
import 'dart:convert';

class ApiServices {
  Future<List<Game>> fetchGame() {
    return http.get(ApiUrls().API_GAME_LIST).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final gameListContainer = _decoder.convert(jsonBody);
      final List games = gameListContainer['data'];
      return games.map((contactRaw) => new Game.fromJson(contactRaw)).toList();
    });
  }
}
