import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_book/models/YoutubeChannelInfo.dart';

import '../constants/constant_values.dart';
import '../models/YoutubePlaylistInfo.dart';
import 'package:intl/intl.dart';

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

  static String getFormattedTime(int timeInMillis) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    var dateString = DateFormat('dd/MMM/yyyy, hh:mm a').format(dateTime);
    return dateString;
  }

  static String getLimitedCharsText(String text) {
    if (text.length > Consts.userNameLength) {
      return "${text.substring(0, Consts.userNameLength)}...";
    } else {
      return text;
    }
  }
}
