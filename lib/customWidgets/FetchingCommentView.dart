import 'package:flutter/material.dart';

import '../constants/AppStrings.dart';

class FetchingCommentView extends StatelessWidget {
  const FetchingCommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        CircularProgressIndicator(),
        SizedBox(height: 10),
        Text(AppStrings.fetchingCommentList)
      ],
    ));
  }
}
