import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_book/helpers/Extensions.dart';

class VideoListLoadingView extends StatelessWidget {
  VideoListLoadingView({Key? key}) : super(key: key);
  final ThemeData themeData = ThemeData();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Shimmer.fromColors(
            baseColor: _getShimmerBaseColor(context),
            highlightColor: _getShimmerBaseColor(context),
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  print("renderring loading view at index : $index");
                  return Container(
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 100,
                          color: Colors.red,
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
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
                })));
  }

  Color _getShimmerBaseColor(BuildContext context) {
    if (context.isDarkMode) {
      return Colors.black54;
    } else {
      return Colors.grey[300] as Color;
    }
  }

  Color _getShimmerHighlightColor(BuildContext context) {
    if (context.isDarkMode) {
      return Colors.black12;
    } else {
      return Colors.grey[100] as Color;
    }
  }
}
