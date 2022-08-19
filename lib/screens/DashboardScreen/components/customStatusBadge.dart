import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';

class CustomStatusBadge extends StatelessWidget {
  const CustomStatusBadge({
    Key? key,
    required this.color, required this.status,
  }) : super(key: key);
  final Color color;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: getProportionalHeight(18),
      width: getProportionalWidth(80),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(getProportionalWidth(10)!),
      ),
      child: Text(
        status,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: getProportionalWidth(10),
        ),
      ),
    );
  }
}