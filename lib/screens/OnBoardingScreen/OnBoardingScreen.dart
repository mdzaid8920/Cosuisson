
import 'package:cuission/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/size_config.dart';
import '../SignInOptionsScreen/SignInOptionsScreen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static String routeName = '/onboarding_screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Image.asset("assets/images/logo.png"),
        ),
        SizedBox(
          height: getProportionalHeight(10),
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                  alignment: Alignment.center,
                  duration: Duration(seconds: 2),
                  curve: Curves.bounceIn,
                  child: SignInOptionsScreen(),
                  type: PageTransitionType.scale),
            );
          },
          child: Container(
            alignment: Alignment.center,
            height: getProportionalHeight(50),
            width: getProportionalWidth(120),
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Get started >",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}
