import 'package:app_metastream/services/api_video_service.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:video_player/video_player.dart';

class DefaultPlayer extends StatefulWidget {
  const DefaultPlayer({Key? key, required this.videoId}) : super(key: key);
  final String videoId;
  @override
  _DefaultPlayerState createState() => _DefaultPlayerState();
}

class _DefaultPlayerState extends State<DefaultPlayer> {
  String play_url = '';
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    playurl(widget.videoId);
    videoplay(play_url);
  }

  Future<void> playurl(String id) async {
    var response = await ApiVideoServices().fetchVideoById(id);
    String url = response.playUrl!;
    setState(() {
      play_url = url.replaceAll(' ', '%20');
    });
    videoplay(play_url);
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
