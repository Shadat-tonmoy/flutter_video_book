import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_book/helpers/CacheHelper.dart';
import 'package:video_book/models/CommentModel.dart';

import '../../constants/constant_values.dart';
import '../../models/YoutubePlaylistInfo.dart';
import 'package:flutter/material.dart';

class VideoDetailsScreenViewModel {
  VideoItem? _videoItem;
  bool _isPlayerReady = false;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final CacheHelper cacheHelper = CacheHelper();

  void initValueFromWidget(VideoItem videoItem) {
    _videoItem = videoItem;
  }

  String getVideoId() {
    return _videoItem?.videoInfo.resourceId.videoId ?? "";
  }

  String getVideoTitle() {
    return _videoItem?.videoInfo.title ?? "";
  }

  Future<OperationResult> sendCommentToFireStore(String commentText) async {
    try {
      final signedInUser = await cacheHelper.getSignedInUser();
      if (signedInUser != null) {
        final videoId = getVideoId();
        final comment = Comment(
            commentText: commentText,
            userName: signedInUser.displayName,
            userProfileImageUrl: signedInUser.profileImageUrl,
            timeStamp: Timestamp.now().millisecondsSinceEpoch);
        final result = await fireStore
            .collection(CommentDBPath.videoDataRoot)
            .doc(videoId)
            .collection(CommentDBPath.commentRoot)
            .add(comment.toJson());
        print("PushComment result : $result, for videoId : ${videoId}");
        return OperationResult.success;
      }
    } catch (exception) {
      print("Exception while sendCommentTOFIreStore : $exception");
      return OperationResult.failed;
    }
    return OperationResult.failed;
  }
}
