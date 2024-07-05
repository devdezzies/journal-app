import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String initValue;
  final bool obscured;
  final TextEditingController controller;
  const AuthField({super.key, required this.initValue, required this.obscured, required this.controller});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).primaryColor
        ),
        decoration: InputDecoration(
          hintText: initValue
        ),
        obscureText: obscured,
      ),
    );
  }
}