import 'package:flutter/material.dart';
import 'package:video_book/constants/AppStrings.dart';

import '../constants/Styles.dart';

class VideoCommentBox extends StatelessWidget {
  VideoCommentBox({Key? key, required this.onCommentSend}) : super(key: key);

  final TextEditingController messageTextEditingController =
      TextEditingController();
  final Function onCommentSend;
  var _message = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: messageContainerDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: messageTextEditingController,
              onChanged: (value) {
                _message = value;
              },
              decoration: messageTextFieldDecoration,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
          MaterialButton(
            onPressed: () {
              messageTextEditingController.clear();
              onCommentSend(_message);
            },
            child: const Text(
              AppStrings.send,
              style: sendButtonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
