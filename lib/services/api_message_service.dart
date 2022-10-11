// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_new, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unnecessary_null_comparison

import 'package:app_metastream/models/message_model.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';
import 'dart:convert';

class ApiMessageServices {
  Future<List<MessageModel>> getMessages(String slug) async {
    return await http
        .get(Uri.parse('${URL().API_URL}/api/v1/message/${slug}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final messageListContainer = _decoder.convert(jsonBody);
      List messages = messageListContainer['data'];
      return messages
          .map((contactRaw) => new MessageModel.fromJson(contactRaw))
          .toList();
    });
  }
}
