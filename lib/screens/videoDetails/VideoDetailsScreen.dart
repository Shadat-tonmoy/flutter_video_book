import 'package:flutter/material.dart';
import 'package:video_book/customWidgets/CommentStream.dart';
import 'package:video_book/customWidgets/VideoCommentBox.dart';
import 'package:video_book/models/YoutubePlaylistInfo.dart';
import 'package:video_book/screens/videoDetails/VideoDetailsScreenViewModel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../constants/Styles.dart';

class VideoDetailsScreen extends StatefulWidget {
  final VideoItem videoItem;

  const VideoDetailsScreen({Key? key, required this.videoItem})
      : super(key: key);

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  YoutubePlayerController? _playerController;
  final VideoDetailsScreenViewModel _viewModel = VideoDetailsScreenViewModel();

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    _viewModel.initValueFromWidget(widget.videoItem);
    _playerController = YoutubePlayerController(
        initialVideoId: _viewModel.getVideoId(),
        flags: const YoutubePlayerFlags(
            mute: false, autoPlay: true, hideThumbnail: true))
      ..addListener(_youtubePlayerListener);
  }

  void _youtubePlayerListener() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_viewModel.getVideoTitle()),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _playerController!,
          ),
          CommentStream(videoId: _viewModel.getVideoId()),
          VideoCommentBox(onCommentSend: _onCommentSend),
        ],
      ),
    );
  }

  void _onCommentSend(String text) {
    print("WIll send comment to firebase as : ${text}");
    _viewModel.sendCommentToFireStore(text);
  }

  @override
  void dispose() {
    _playerController?.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _playerController?.pause();
    super.deactivate();
  }
}
