import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_book/models/YoutubeChannelInfo.dart';
import 'package:video_book/models/YoutubePlaylistInfo.dart';

class VideoItemView extends StatelessWidget {
  final VideoItem item;
  final int index;
  final Function onTapListener;

  const VideoItemView(
      {Key? key,
      required this.index,
      required this.item,
      required this.onTapListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                  imageUrl: item.videoInfo.thumbnails.medium.url),
              const SizedBox(height: 16),
              Text(item.videoInfo.title,
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20)),
              const SizedBox(height: 16),
              Text(
                item.videoInfo.description,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
      onTap: () => {onTapListener(index, item)},
    );
  }
}
