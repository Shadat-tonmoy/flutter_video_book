import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_book/models/YoutubeChannelInfo.dart';

import '../models/YoutubePlaylistInfo.dart';

class UIHelper {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static List<ContentContainer> getContentList(
      ChannelInfo channelInfo, VideoList videoList) {
    final List<ContentContainer> list = [];
    list.add(ContentContainer(channelInfo: channelInfo, videoItem: null));
    for (var videoItem in videoList.videos) {
      list.add(ContentContainer(channelInfo: null, videoItem: videoItem));
    }
    return list;
  }
}
