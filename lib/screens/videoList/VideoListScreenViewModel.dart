import 'package:video_book/constants/constant_values.dart';

import '../../helpers/NetworkHelper.dart';
import '../../helpers/UIHelper.dart';
import '../../models/YoutubeChannelInfo.dart';
import '../../models/YoutubePlaylistInfo.dart';

class VideoListScreenViewModel {
  ChannelInfo? _channelInfo;
  VideoList? _videoList;
  bool isLoading = true;
  String _playlistId = '';
  String _nextPageToken = '';
  List<ContentContainer> contentList = [];

  void initValues() {
    _playlistId = '';
    _nextPageToken = '';
    contentList = [];
  }

  Future<OperationResult> fetchVideoData() async {
    try {
      await _fetchChannelInfo();
      await _fetchVideoList();
      return OperationResult.success;
    } catch (exception) {
      print("Exception in fetchVideoData : ${exception}");
      return OperationResult.failed;
    }
  }

  Future<void> _fetchChannelInfo() async {
    print("Fetching channel info");
    ChannelInfo channelInfo = await NetworkHelper.getChannelInfo();
    print(
        "Playlist Id : ${channelInfo.items[0].contentDetails.relatedPlaylists.uploads}");
    _playlistId = channelInfo.items[0].contentDetails.relatedPlaylists.uploads;
    print("Playlist Id : ${_playlistId}");
    _channelInfo = channelInfo;
  }

  Future<void> _fetchVideoList() async {
    // print("Fetching video list");
    VideoList videoList = await NetworkHelper.getVideosList(
        playlistId: _playlistId, pageToken: _nextPageToken);
    _nextPageToken = videoList.nextPageToken;
    // _videoList?.videos.addAll(videoList.videos);
    _videoList = videoList;
    if (_channelInfo != null) {
      contentList = UIHelper.getContentList(_channelInfo!, videoList);
    }
    print("Videos : ${_videoList?.videos.length}");
    isLoading = false;
  }
}
