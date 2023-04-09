import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

import '../constants/AppStrings.dart';

class NoCommentFoundView extends StatelessWidget {
  const NoCommentFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          FontAwesomeIcons.comments,
          size: 50,
          color: Colors.blue,
        ),
        SizedBox(height: 10),
        Text(AppStrings.noCommentFound)
      ],
    ));
  }
}
