import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:video_book/constants/constant_values.dart';

import '../models/YoutubeChannelInfo.dart';

class NetworkHelper {
  /*
  curl \
  'https://youtube.googleapis.com/youtube/v3/channels?part=snippet%2CcontentDetails%2Cstatistics&id=UC4zWG9LccdWGUlF77LZ8toA&access_token=AIzaSyCHDqJkVGYlhmMwFTfjhXikv3zyFmUxogU&key=[YOUR_API_KEY]' \
  --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  --header 'Accept: application/json' \
  --compressed
  * */
  static const channelID = "UC4zWG9LccdWGUlF77LZ8toA";
  static const baseURL = "youtube.googleapis.com";

  static Future<ChannelInfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': channelID,
      'key': Keys.youtubeAPIKey
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    Uri uri = Uri.https(baseURL, '/youtube/v3/channels', parameters);

    http.Response response = await http.get(uri, headers: headers);
    print("Response : ${response.body}");
    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo;


  }
}
