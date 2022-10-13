// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, unnecessary_this, non_constant_identifier_names

import 'package:app_metastream/services/api_video_service.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:video_player/video_player.dart';

class DefaultPlayer extends StatefulWidget {
  const DefaultPlayer({Key? key, required this.videoSlug}) : super(key: key);
  final String videoSlug;
  @override
  _DefaultPlayerState createState() => _DefaultPlayerState();
}

class _DefaultPlayerState extends State<DefaultPlayer> {
  late FlickManager flickManager;
  String? urlVideo;

  @override
  void initState() {
    super.initState();
    playurl(widget.videoSlug);
    videoplay(urlVideo.toString());
  }

  Future<void> playurl(String slug) async {
    var response = await ApiVideoServices().fetchVideoBySlug(slug);
    if (response?.playUrl == null) return;
    String url = response!.playUrl!;
    String play_url = url.replaceAll(' ', '%20');
    if (!mounted) return;

    setState(() {
      urlVideo = play_url;
    });
    videoplay(urlVideo.toString());
  }

  Future<void> videoplay(String url) async {
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        url,
        closedCaptionFile: _loadCaptions(),
      ),
    );
  }

  ///If you have subtitle assets
  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context)
        .loadString('images/bumble_bee_captions.srt');
    flickManager.flickControlManager!.toggleSubtitle();
    return SubRipCaptionFile(fileContents);
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && this.mounted) {
          flickManager.flickControlManager?.autoPause();
        } else if (visibility.visibleFraction == 1) {
          flickManager.flickControlManager?.autoResume();
        }
      },
      child: Container(
        child: FlickVideoPlayer(
          flickManager: flickManager,
          flickVideoWithControls: const FlickVideoWithControls(
            closedCaptionTextStyle: TextStyle(fontSize: 8),
            controls: FlickPortraitControls(),
          ),
          flickVideoWithControlsFullscreen: const FlickVideoWithControls(
            controls: FlickLandscapeControls(),
          ),
        ),
      ),
    );
  }
}
