import 'package:flutter/material.dart';
import 'package:video_book/customWidgets/ChannelInfoView.dart';
import 'package:video_book/helpers/NetworkHelper.dart';
import 'package:video_book/models/YoutubeChannelInfo.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  ChannelInfo? _channelInfo;

  @override
  void initState() {
    super.initState();
    _fetchChannelInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (_channelInfo != null) ChannelInfoView(channelInfo: _channelInfo!)
        ],
      ),
    );
  }

  void _fetchChannelInfo() async {
    print("Fetching channel info");
    ChannelInfo channelInfo = await NetworkHelper.getChannelInfo();
    setState(() {
      _channelInfo = channelInfo;
    });
  }
}
