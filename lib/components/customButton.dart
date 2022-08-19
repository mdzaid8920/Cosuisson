import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    required this.press, required this.color,
  }) : super(key: key);
  final double height;
  final double width;
  final String text;
  final Color color;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        height: getProportionalHeight(height),
        width: getProportionalWidth(width),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
