import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key,
      required this.controller,
      required this.obsecure,
      required this.labelText,
      required this.hintText,
      required this.isTemperature,
      required this.keyBoardType})
      : super(key: key);

  final TextEditingController controller;
  final bool obsecure;
  final String labelText;
  final String hintText;
  final bool isTemperature;
  final TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionalWidth(15)!),
      child: TextFormField(
        style: TextStyle(color: kHeadingColor),
        controller: controller,
        obscureText: obsecure,
        keyboardType: keyBoardType,
        cursorColor: kHeadingColor,
        decoration: InputDecoration(
          // fillColor: Colors.white,
          // filled: true,
          suffixIcon: isTemperature
              ? Text(
                  "°C",
                  textAlign: TextAlign.center,
                )
              : Text(""),

          label: Text(
            labelText,
            style: TextStyle(color: kHeadingColor, fontWeight: FontWeight.w500),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black54,
            fontSize: getProportionalHeight(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: kHeadingColor, width: 1.1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getProportionalWidth(10)!),
            // borderSide: BorderSide.none,
          ),
          // border: InputBorder.none,
          // suffixIcon: Container(
          //   padding: EdgeInsets.all(getProportionalHeight(13)!),
          //   child: SvgPicture.asset(
          //     "assets/icons/Lock.svg",
          //     color: kTextColor3,
          //   ),
          // ),
        ),
      ),
    );
  }
}


