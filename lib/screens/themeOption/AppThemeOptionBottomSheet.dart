import 'package:flutter/material.dart';
import 'package:video_book/constants/AppStrings.dart';
import 'package:video_book/constants/Styles.dart';
import 'package:video_book/helpers/CacheHelper.dart';
import 'package:video_book/helpers/UIHelper.dart';

class AppThemeOptionBottomSheet extends StatelessWidget {
  AppThemeOptionBottomSheet({Key? key}) : super(key: key);
  final CacheHelper cacheHelper = CacheHelper();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            AppStrings.setAppTheme,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.light_mode),
          title: const Text(AppStrings.light),
          onTap: () {
            _setAppThemeAtCache(AppThemes.themeLight, context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.dark_mode),
          title: const Text(AppStrings.dark),
          onTap: () {
            _setAppThemeAtCache(AppThemes.themeDark, context);
          },
        )
      ],
    );
  }

  void _setAppThemeAtCache(int value, BuildContext context) {
    cacheHelper.cacheAppTheme(value).then((value) {
      UIHelper.showToast(AppStrings.themeUpdatedMessage);
      Navigator.pop(context);
    });
  }
}
