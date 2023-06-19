import 'package:flutter/material.dart';

class CoreRoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const CoreRoundedButton(
      {Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 20,
        ),
      ),
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), primary: Colors.white),
    );
  }
}
