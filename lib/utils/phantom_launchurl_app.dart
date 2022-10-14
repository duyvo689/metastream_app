import 'package:url_launcher/url_launcher.dart';

phantomLaunchURLApp(String link) async {
  var url =
      'https://phantom.app/ul/browse/https://staging.metastream.network/${link}';
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false, forceWebView: false);
  } else {
    throw 'Could not launch $url';
  }
}
