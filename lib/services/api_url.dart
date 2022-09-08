// var url = 'http://localhost:3000/api/v1';
var url = 'https://api-staging.metastream.network';

class URL {
  final String API_URL = url;
}

class ApiUrls {
  final Uri API_GAME_LIST = Uri.parse('${url}/game');

  final Uri API_VIDEO_LIST = Uri.parse('${url}/video');

  final Uri API_USER_LIST = Uri.parse('${url}/user');

  final Uri API_BANNER = Uri.parse('${url}/banner');
}
