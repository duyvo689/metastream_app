import 'package:http/http.dart' as http;
import '../models/video.dart';
import 'api_url.dart';
import 'dart:convert';

class ApiVideoServices {
  Future<List<Video>> fetchVideos() {
    return http.get(ApiUrls().API_VIDEO_LIST).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
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
        .get(Uri.parse('http://localhost:3000/api/v1/video/${id}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
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
        .get(Uri.parse('http://localhost:3000/api/v1/video/user/${id}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
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
    return http
        .get(Uri.parse('http://localhost:3000/api/v1/video/game/${id}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
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
