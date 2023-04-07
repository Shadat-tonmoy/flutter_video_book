import 'package:flutter/material.dart';
import 'package:video_book/helpers/CacheHelper.dart';

import '../helpers/AuthHelper.dart';
import '../models/AuthModels.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SignedInUser? signedInUser;

  @override
  void initState() {
    fetchSignedInUser();
    super.initState();
  }

  void fetchSignedInUser() async {
    var user = await _getSignedInUser();
    setState(() {
      signedInUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            signedInUser?.profileImageUrl ?? ""),
                        radius: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(signedInUser?.displayName ?? "",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          Text(signedInUser?.email ?? "")
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<SignedInUser?> _getSignedInUser() async {
    var signedInUser = CacheHelper().getSignedInUser();
    print("SignedInUser : ${signedInUser}");
    return signedInUser;
  }
}
