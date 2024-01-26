import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text, required this.onTap});
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: Colors.blue[700],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Text(text, textAlign: TextAlign.center,));
  }
}
