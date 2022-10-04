import 'package:app_metastream/models/live_streaming_model.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';
import 'dart:convert';

class ApiLiveStreamingServices {
  Future<List<LiveStream>> fetchLiveStreaming(int status) {
    return http
        .get(
            Uri.parse('${URL().API_URL}/api/v1/streamer/live-stream/${status}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final userListContainer = _decoder.convert(jsonBody);
      final List users = userListContainer['data'];
      return users
          .map((contactRaw) => new LiveStream.fromJson(contactRaw))
          .toList();
    });
  }
}
