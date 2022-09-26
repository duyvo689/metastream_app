import 'package:app_metastream/models/models.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';
import 'dart:convert';

class ApiGameServices {
  Future<List<Game>> fetchGame() {
    return http
        .get(Uri.parse('${URL().API_URL}/api/v1/game'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final gameListContainer = _decoder.convert(jsonBody);
      final List games = gameListContainer['data'];
      return games.map((contactRaw) => new Game.fromJson(contactRaw)).toList();
    });
  }

  Future<Game> fetchGameById(String id) {
    return http
        .get(Uri.parse('${URL().API_URL}/api/v1/game/${id}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final gameContainer = _decoder.convert(jsonBody);
      final game = gameContainer['data'];

      return Game.fromJson(game);
    });
  }

  Future ApiFollowGame(String id, String gameId, bool isFollow) async {
    final response = await http.put(
      Uri.parse('${URL().API_URL}/api/v1/follow/game/${id}'), //of minh
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'idGame': gameId, //of nguoi duoc fl
        'isFollow': isFollow,
      }),
    );
  }
}
