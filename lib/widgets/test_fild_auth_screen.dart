import 'package:flutter/material.dart';
class TextFildInAuthScreen extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextEditingController controller;

  TextFildInAuthScreen({
    required this.controller,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: text,
          prefixIcon: Icon(icon),
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}