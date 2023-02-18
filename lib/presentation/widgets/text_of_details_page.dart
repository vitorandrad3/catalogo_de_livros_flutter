import 'package:flutter/material.dart';

class TextofDetails extends StatelessWidget {
  const TextofDetails({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF4CAF50),
          fontSize: 16.5),
    );
  }
}

class TextofDetails2 extends StatelessWidget {
  const TextofDetails2({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
    );
  }
}
