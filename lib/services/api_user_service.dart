import 'package:app_metastream/models/models.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';
import 'dart:convert';

class ApiUserServices {
  Future<List<User>> fetchUsers() {
    return http
        .get(Uri.parse('${URL().API_URL}/api/v1/user'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final userListContainer = _decoder.convert(jsonBody);
      final List users = userListContainer['data'];
      return users.map((contactRaw) => new User.fromJson(contactRaw)).toList();
    });
  }

  Future<User> fetchUserById(String id) {
    return http
        .get(Uri.parse('${URL().API_URL}/api/v1/user/${id}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final userContainer = _decoder.convert(jsonBody);
      final user = userContainer['data'];

      return User.fromJson(user);
    });
  }

  Future<User?> fetchUserByWalletAddress(String address) async {
    return await http
        .get(Uri.parse('${URL().API_URL}/api/v1/user/address/${address}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final userContainer = _decoder.convert(jsonBody);
      final user = userContainer['data'];
      if (user == null) {
        return null;
      } else {
        return User.fromJson(user);
      }
    });
  }

  Future ApiFollowUser(String id, String userId, bool isFollow) async {
    final response = await http.put(
      Uri.parse('${URL().API_URL}/api/v1/user/follow/${id}'), //of minh
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'idUser': userId, //of nguoi duoc fl
        'isFollow': isFollow,
      }),
    );
  }

  Future ApiCreateUser(String addressWallet) async {
    return await http
        .post(
      Uri.parse('${URL().API_URL}/api/v1/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{'addressWallet': addressWallet}),
    )
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final userContainer = _decoder.convert(jsonBody);
      final user = userContainer['data'];
      return User.fromJson(user);
    });
  }

  Future ApiUpdateInfoUser(
    String idUser,
    String firstName,
    String lastName,
    String userName,
    String email,
    String description,
  ) async {
    return await http
        .put(
      Uri.parse('${URL().API_URL}/api/v1/user/${idUser}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'firstName': firstName,
        'lastName': lastName,
        'userName': userName,
        'email': email,
        'description': description,
      }),
    )
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final userContainer = _decoder.convert(jsonBody);
      final user = userContainer['data'];
      return User.fromJson(user);
    });
  }
}
