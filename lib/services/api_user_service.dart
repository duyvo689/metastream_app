import 'package:http/http.dart' as http;
import '../models/user.dart';
import 'api_url.dart';
import 'dart:convert';

class ApiUserServices {
  Future<List<User>> fetchUsers() {
    return http.get(ApiUrls().API_USER_LIST).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final userListContainer = _decoder.convert(jsonBody);
      final List users = userListContainer['data'];
      return users.map((contactRaw) => new User.fromJson(contactRaw)).toList();
    });
  }
}
