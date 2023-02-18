import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({required this.image, super.key});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF4CAF50),
        borderRadius: BorderRadius.only(
          topRight: Radius.elliptical(15, 100),
          bottomRight: Radius.elliptical(300, 200),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 40, right: 60),
        child: Image.network(image),
      ),
    );
  }
}
