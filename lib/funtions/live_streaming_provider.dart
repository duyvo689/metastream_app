import 'package:app_metastream/models/live_streaming_model.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

class LiveStreamingProvider extends ChangeNotifier {
  List<LiveStream>? _liveStreams;
  List<LiveStream>? _videoLiving;

  List<LiveStream>? get liveStreamList => _liveStreams;
  List<LiveStream>? get videoLiving => _videoLiving;
  // ignore: non_constant_identifier_names
  Future GetUserListProvider(int status) async {
    List<LiveStream>? listLiveStreamTrue =
        await ApiLiveStreamingServices().fetchLiveStreaming(1);
    List<LiveStream>? listLiveStreamFalse =
        await ApiLiveStreamingServices().fetchLiveStreaming(4);
    _liveStreams = [...listLiveStreamTrue, ...listLiveStreamFalse];
    _videoLiving = [...listLiveStreamTrue];
    notifyListeners();
  }
}