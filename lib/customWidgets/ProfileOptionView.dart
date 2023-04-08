import 'package:flutter/material.dart';

class ProfileOptionView extends StatelessWidget {
  final Function optionClickListener;
  final String title;
  final IconData iconData;

  const ProfileOptionView(
      {required this.title,
      required this.iconData,
      required this.optionClickListener,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => optionClickListener(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
