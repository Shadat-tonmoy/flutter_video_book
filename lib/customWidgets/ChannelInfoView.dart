import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_book/models/YoutubeChannelInfo.dart';

class ChannelInfoView extends StatelessWidget {
  final ChannelInfo channelInfo;

  const ChannelInfoView({Key? key, required this.channelInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = channelInfo.items[0];
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  item.snippet.thumbnails.medium.url),
              radius: 40,
            ),
            const SizedBox(height: 16),
            Text(item.snippet.title,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            const SizedBox(height: 16),
            Text(
              item.snippet.description,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
