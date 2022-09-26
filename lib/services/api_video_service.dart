import 'package:app_metastream/models/models.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';
import 'dart:convert';

class ApiVideoServices {
  Future<List<Video>> fetchVideos() {
    return http
        .get(Uri.parse('${URL().API_URL}/api/v1/video'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final videoListContainer = _decoder.convert(jsonBody);
      final List videos = videoListContainer['data'];
      return videos
          .map((contactRaw) => new Video.fromJson(contactRaw))
          .toList();
    });
  }

  Future<Video> fetchVideoById(String id) {
    return http
        .get(Uri.parse('${URL().API_URL}/api/v1/video/${id}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final videoContainer = _decoder.convert(jsonBody);
      final video = videoContainer['data'];

      return Video.fromJson(video);
    });
  }

  Future<List<Video>> fetchVideosOfUser(String id) {
    return http
        .get(Uri.parse('${url}/api/v1/video/user/${id}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final videoListContainer = _decoder.convert(jsonBody);
      final List videos = videoListContainer['data'];
      return videos
          .map((contactRaw) => new Video.fromJson(contactRaw))
          .toList();
    });
  }

  Future<List<Video>> fetchVideosOfGame(String id) {
    print(id);
    return http
        .get(Uri.parse('${URL().API_URL}/api/v1/video/game/${id}/1'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final videoListContainer = _decoder.convert(jsonBody);
      final List videos = videoListContainer['data'];
      return videos
          .map((contactRaw) => new Video.fromJson(contactRaw))
          .toList();
    });
  }
}
