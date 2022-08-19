import 'package:cuission/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/size_config.dart';

class CustomSigninButton extends StatelessWidget {
  const CustomSigninButton({
    Key? key,
    required this.text,
    required this.press,
    required this.svgSrc,
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  final String svgSrc;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
        height: getProportionalHeight(60),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor2,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kPrimaryColor2),
        ),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(getProportionalWidth(8)!),
              margin: EdgeInsets.all(getProportionalWidth(0.02)!),
              height: double.infinity,
              width: getProportionalWidth(60),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                border: Border.all(color: kPrimaryColor2),
              ),
              child: SvgPicture.asset(svgSrc),
            ),
          ),
          SizedBox(
            width: getProportionalWidth(60),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          )
        ]),
      ),
    );
  }
}