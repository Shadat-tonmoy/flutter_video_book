import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_book/helpers/CacheHelper.dart';

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

  String geVideoId() {
    return _videoItem?.videoInfo.resourceId.videoId ?? "";
  }

  String getVideoTitle() {
    return _videoItem?.videoInfo.title ?? "";
  }

  Future<OperationResult> sendCommentToFireStore(String comment) async {
    try {
      final signedInUser = await cacheHelper.getSignedInUser();
      if (signedInUser != null) {
        final videoId = geVideoId();
        final result = await fireStore
            .collection(CommentDBPath.commentRoot)
            .doc(videoId)
            .collection("")
            .add(getCommentForDB(
                comment: comment,
                senderName: signedInUser.displayName,
                senderPhotoUri: signedInUser.profileImageUrl));
        return OperationResult.success;
      }
    } catch (exception) {
      print("Exception while sendCommentTOFIreStore : $exception");
      return OperationResult.failed;
    }
    return OperationResult.failed;
  }

  Map<String, dynamic> getCommentForDB(
      {required String comment,
      required String senderName,
      required String senderPhotoUri}) {
    return {
      CommentDBPath.commentTextRoot: comment,
      CommentDBPath.commentSenderRoot: senderName,
      CommentDBPath.commentSenderPhotoRoot: senderPhotoUri,
      CommentDBPath.commentTimeRoot: Timestamp.now().millisecondsSinceEpoch,
    };
  }
}
