
import 'package:cuission/screens/AdminScreens/AdminSignInScreen/AdminSignInScreen.dart';
import 'package:cuission/utils/constants.dart';
import 'package:cuission/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../SignInMethodsScreen/SignInScreen.dart';

class SignInOptionsScreen extends StatefulWidget {
  const SignInOptionsScreen({Key? key}) : super(key: key);
  static String routeName = "/signInOptionsScreen";

  @override
  State<SignInOptionsScreen> createState() => _SignInOptionsScreenState();
}

class _SignInOptionsScreenState extends State<SignInOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Select User Type",
                      style: TextStyle(
                          color: kTextColor1.withOpacity(0.8),
                          fontSize: getProportionalWidth(18),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: getProportionalHeight(10),
                    ),
                    CustomUserTypeButton(
                      text: "Ceramiste",
                      press: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              child: SignInScreen(),
                              type: PageTransitionType.rightToLeft),
                        );
                      },
                    ),
                    SizedBox(
                      height: getProportionalHeight(30),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(),
                    ),
                    SizedBox(
                      height: getProportionalHeight(30),
                    ),
                    CustomUserTypeButton(
                      text: "Atelier",
                      press: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              child: AdminSignInScreen(),
                              type: PageTransitionType.rightToLeft),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomUserTypeButton extends StatelessWidget {
  const CustomUserTypeButton({
    Key? key,
    required this.press,
    required this.text,
  }) : super(key: key);
  final VoidCallback press;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: getProportionalWidth(30)!),
        height: getProportionalHeight(60),
        width: double.infinity,
        decoration: BoxDecoration(
            color: kPrimaryColor2, borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
