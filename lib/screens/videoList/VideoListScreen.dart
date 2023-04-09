import 'package:flutter/material.dart';
import 'package:video_book/constants/ConstantValues.dart';
import 'package:video_book/customWidgets/ChannelInfoView.dart';
import 'package:video_book/customWidgets/VideoItemVIew.dart';
import 'package:video_book/customWidgets/VideoListLoadingView.dart';
import 'package:video_book/models/YoutubePlaylistInfo.dart';
import 'package:video_book/screens/videoDetails/VideoDetailsScreen.dart';
import 'package:video_book/screens/videoList/VideoListScreenViewModel.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  final VideoListScreenViewModel _viewModel = VideoListScreenViewModel();
  OperationResult _videoFetchResult = OperationResult.progress;

  @override
  void initState() {
    super.initState();
    _initValues();
    _fetchVideoData();
  }

  void _initValues() {
    _viewModel.initValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (_videoFetchResult == OperationResult.progress)
            const VideoListLoadingView()
          else
            Expanded(
              child: ListView.builder(
                itemCount: _viewModel.contentList.length,
                itemBuilder: (context, index) {
                  final itemContent = _viewModel.contentList[index];
                  if (itemContent.isChannelInfo()) {
                    return ChannelInfoView(
                        channelInfo: itemContent.channelInfo!);
                  } else if (itemContent.isVideoItem()) {
                    return VideoItemView(
                        index: index,
                        item: itemContent.videoItem!,
                        onTapListener: _videoItemTapListener);
                  }
                },
              ),
            )
        ],
      ),
    );
  }

  void _videoItemTapListener(int index, VideoItem videoItem) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => VideoDetailsScreen(videoItem: videoItem)));
    print(
        "Will show details of ${videoItem.id}, title : ${videoItem.videoInfo.title}");
  }

  void _fetchVideoData() async {
    var result = await _viewModel.fetchVideoData();
    setState(() {
      _videoFetchResult = result;
    });
  }
}
