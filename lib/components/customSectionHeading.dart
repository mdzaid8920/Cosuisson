import 'package:cuission/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';

class CustomSectionHeading extends StatelessWidget {
  const CustomSectionHeading({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionalWidth(20)!),
      child: Text(
        text,
        style: TextStyle(
            color: kHeadingColor,
            fontSize: getProportionalWidth(20),
            fontWeight: FontWeight.w600),
      ),
    );
  }
}