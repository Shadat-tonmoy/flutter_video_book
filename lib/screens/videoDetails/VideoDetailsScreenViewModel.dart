
import '../../models/YoutubePlaylistInfo.dart';
import 'package:flutter/material.dart';

class VideoDetailsScreenViewModel{

  VideoItem? _videoItem;
  bool _isPlayerReady = false;

  void initValueFromWidget(VideoItem videoItem){

    _videoItem = videoItem;

  }

  String getInitialVideoId() {
    return _videoItem?.videoInfo.resourceId.videoId ?? "";
  }

  String getVideoTitle() {
    return _videoItem?.videoInfo.title ?? "";
  }

}