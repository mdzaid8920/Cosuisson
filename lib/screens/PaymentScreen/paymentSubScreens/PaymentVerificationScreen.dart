import 'package:cuission/components/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import '../../DashboardScreen/DashBaordScreen.dart';

class PaymentVerificationScreen extends StatefulWidget {
  const PaymentVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PaymentVerificationScreen> createState() =>
      _PaymentVerificationScreenState();
}

class _PaymentVerificationScreenState extends State<PaymentVerificationScreen> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verification",
          style: TextStyle(
              color: kHeadingColor,
              fontSize: getProportionalWidth(18),
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionalWidth(15)!),
            child: Icon(
              Icons.notifications,
              color: kHeadingColor,
              size: getProportionalWidth(26),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: getProportionalHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/stripe logo.svg",
                width: getProportionalWidth(30),
                height: getProportionalHeight(30),
              ),
            ],
          ),
          SizedBox(
            height: getProportionalHeight(30),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
            child: Text(
              "We have sent you a four-digit code to your email address. Enter the code below to verify your account.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(
                  0xff242424,
                ),
              ),
            ),
          ),
          SizedBox(
            height: getProportionalHeight(30),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      color: Colors.red, height: SizeConfig.screenHeight! * 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: getProportionalWidth(60),
                        child: TextFormField(
                          autofocus: true,
                          obscureText: false,
                          style: TextStyle(fontSize: 24),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: getProportionalWidth(15)!),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  getProportionalWidth(15)!),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  getProportionalWidth(15)!),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  getProportionalWidth(15)!),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          onChanged: (value) {
                            nextField(value, pin2FocusNode);
                          },
                        ),
                      ),
                      SizedBox(
                        width: getProportionalWidth(60),
                        child: TextFormField(
                          focusNode: pin2FocusNode,
                          obscureText: false,
                          style: TextStyle(fontSize: 24),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: getProportionalWidth(15)!),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  getProportionalWidth(15)!),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  getProportionalWidth(15)!),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  getProportionalWidth(15)!),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          onChanged: (value) => nextField(value, pin3FocusNode),
                        ),
                      ),
                      SizedBox(
                        width: getProportionalWidth(60),
                        child: TextFormField(
                          focusNode: pin3FocusNode,
                          obscureText: false,
                          style: TextStyle(fontSize: 24),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: getProportionalWidth(15)!),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  getProportionalWidth(15)!),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  getProportionalWidth(15)!),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  getProportionalWidth(15)!),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          onChanged: (value) => nextField(value, pin4FocusNode),
                        ),
                      ),
                      SizedBox(
                        width: getProportionalWidth(60),
                        child: TextFormField(
                          focusNode: pin4FocusNode,
                          obscureText: false,
                          style: TextStyle(fontSize: 24),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: getProportionalWidth(15)!),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  getProportionalWidth(15)!),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  getProportionalWidth(15)!),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  getProportionalWidth(15)!),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.length == 1) {
                              pin4FocusNode!.unfocus();
                              // Then you need to check is the code is correct or not
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getProportionalHeight(40),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
            child: CustomButton(
                height: getProportionalHeight(60)!,
                width: double.infinity,
                text: "Verify Identity",
                press: () {
                  Navigator.pushNamedAndRemoveUntil(context,
                      DashBaordScreen.routeName, ModalRoute.withName('/'));
                },
                color: kHeadingColor),
          )
        ],
      ),
    );
  }
}
