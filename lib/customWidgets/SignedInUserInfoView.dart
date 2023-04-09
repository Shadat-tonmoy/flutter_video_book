import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_book/models/AuthModels.dart';

import '../constants/AppStrings.dart';

class SignedInUserInfoCard extends StatelessWidget {
  final SignedInUser? signedInUser;
  final Function singOutListener;

  const SignedInUserInfoCard(
      {required this.signedInUser, required this.singOutListener, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                      signedInUser?.profileImageUrl ?? ""),
                  radius: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(signedInUser?.displayName ?? "",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(signedInUser?.email ?? ""),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          signedInUser?.getSignInWithIcon(),
                          size: 15,
                        ),
                        SizedBox(width: 8),
                        Text(
                          signedInUser?.getSignInWithMessage() ?? "",
                        )
                      ],
                    )
                    // ListTile(
                    //   title: Text(signedInUser?.getSignInWithMessage() ?? ""),
                    //   leading: Icon(signedInUser?.getSignInWithIcon()),
                    // )
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  singOutListener();
                },
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                child: const Text(AppStrings.signOut),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
