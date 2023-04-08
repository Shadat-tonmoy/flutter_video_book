import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VideoListLoadingView extends StatelessWidget {
  const VideoListLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("renderring loading view");
    return Expanded(
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300] as Color,
          highlightColor: Colors.grey[100] as Color,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                print("renderring loading view at index : $index");
                return Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.red,
                      ),
                      Container(
                        width: double.infinity,
                        height: 20,
                        color: Colors.red,
                      ),
                      Container(
                        width: double.infinity,
                        height: 30,
                        color: Colors.red,
                      ),
                    ],
                  ),
                );
              })
        ));
  }
}
