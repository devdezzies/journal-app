import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const AuthButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 30),
            padding: const EdgeInsets.all(10),
            textStyle:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        child: Text(buttonText));
  }
}
