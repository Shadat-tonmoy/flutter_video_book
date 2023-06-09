import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:video_book/constants/ConstantValues.dart';
import 'package:video_book/helpers/Extensions.dart';
import 'package:video_book/helpers/UIHelper.dart';
import 'package:video_book/models/CommentModel.dart';

class CommentView extends StatelessWidget {
  final Comment comment;

  const CommentView({required this.comment, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width * 0.75;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage:
                CachedNetworkImageProvider(comment.userProfileImageUrl),
            radius: 20,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    UIHelper.getLimitedCharsText(comment.userName),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    UIHelper.getFormattedTime(comment.timeStamp),
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Container(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: ExpandableText(
                  comment.commentText,
                  trim: 100,
                  trimType: TrimType.characters,
                  style: TextStyle(color: Colors.black87)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
