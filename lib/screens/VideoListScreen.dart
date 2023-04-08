import 'package:flutter/material.dart';
import 'package:video_book/customWidgets/ChannelInfoView.dart';
import 'package:video_book/customWidgets/VideoItemVIew.dart';
import 'package:video_book/customWidgets/VideoListLoadingView.dart';
import 'package:video_book/helpers/NetworkHelper.dart';
import 'package:video_book/helpers/UIHelper.dart';
import 'package:video_book/models/YoutubeChannelInfo.dart';
import 'package:video_book/models/YoutubePlaylistInfo.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  ChannelInfo? _channelInfo;
  VideoList? _videoList;
  bool _isLoading = true;
  String _playlistId = '';
  String _nextPageToken = '';
  List<ContentContainer> _contentList = [];

  @override
  void initState() {
    super.initState();
    _initValues();
    _fetchChannelInfo();
  }

  void _initValues() {
    _playlistId = '';
    _nextPageToken = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // if (_channelInfo != null) ChannelInfoView(channelInfo: _channelInfo!),
          if(_isLoading) VideoListLoadingView()
          else Expanded(
            child: ListView.builder(
              itemCount: _contentList.length,
              itemBuilder: (context, index) {
                final itemContent = _contentList[index];
                if (itemContent.isChannelInfo()) {
                  return ChannelInfoView(channelInfo: itemContent.channelInfo!);
                } else if (itemContent.isVideoItem()) {
                  return VideoItemView(item: itemContent.videoItem!);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void _fetchChannelInfo() async {
    print("Fetching channel info");
    ChannelInfo channelInfo = await NetworkHelper.getChannelInfo();
    print(
        "Playlist Id : ${channelInfo.items[0].contentDetails.relatedPlaylists.uploads}");
    _playlistId = channelInfo.items[0].contentDetails.relatedPlaylists.uploads;
    print("Playlist Id : ${_playlistId}");
    _channelInfo = channelInfo;
    _fetchVideoList();
    /*setState(() {
      _channelInfo = channelInfo;
    });*/
  }

  void _fetchVideoList() async {
    // print("Fetching video list");
    VideoList videoList = await NetworkHelper.getVideosList(
        playlistId: _playlistId, pageToken: _nextPageToken);
    _nextPageToken = videoList.nextPageToken;
    // _videoList?.videos.addAll(videoList.videos);
    _videoList = videoList;
    if (_channelInfo != null) {
      _contentList = UIHelper.getContentList(_channelInfo!, videoList);
    }
    print("Videos : ${_videoList?.videos.length}");
    _isLoading = false;
    setState(() {});
  }
}
