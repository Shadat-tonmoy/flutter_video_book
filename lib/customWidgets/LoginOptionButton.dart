import 'package:flutter/material.dart';

class LoginOptionButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPressedCallback;
  final IconData icon;

  LoginOptionButton(
      {required this.color,
      required this.text,
      required this.icon,
      required this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
            onPressed: () => {onPressedCallback()},
            child: ListTile(
              leading: Icon(
                icon,
                size: 24.0,
                color: Colors.white,
              ),
              title: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            )),
      ),
    );
  }
}
