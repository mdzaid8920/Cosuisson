import 'package:cuission/screens/AdminScreens/AdminDashboardScreen/AdminDashboardScreen.dart';
import 'package:cuission/screens/DashboardScreen/DashBaordScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../components/CustomFormField.dart';
import '../../../components/customButton.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class GoogleSignInPasswordScreen extends StatefulWidget {
  const GoogleSignInPasswordScreen({Key? key}) : super(key: key);
  static String routeName = "/google-signin-password-screen";

  @override
  State<GoogleSignInPasswordScreen> createState() =>
      _GoogleSignInPasswordScreenState();
}

class _GoogleSignInPasswordScreenState
    extends State<GoogleSignInPasswordScreen> {
  final TextEditingController passwordEditingController =
      TextEditingController();
  // final ValueNotifier<bool> _obsecureTabNotifier = ValueNotifier(true);
  // final ValueNotifier<bool> _checkBoxabNotifier = ValueNotifier(false);
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: getProportionalHeight(100),
            ),
            Container(
              width: double.infinity,
              // height: getProportionalHeight(50),
              child: Image.asset(
                "assets/images/google-logo.png",
                height: getProportionalHeight(30),
                width: getProportionalWidth(30),
              ),
            ),
            SizedBox(
              height: getProportionalHeight(20),
            ),
            Text(
              "Welcome",
              style: TextStyle(
                  color: kTextColor1.withOpacity(0.8),
                  fontSize: getProportionalWidth(16),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: getProportionalHeight(10),
            ),
            Container(
              // alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionalWidth(10)!,
                  vertical: getProportionalHeight(5)!),
              // height: getProportionalHeight(50),
              // width: getProportionalWidth(100),
              constraints: BoxConstraints(
                  maxWidth: getProportionalWidth(300)!,
                  maxHeight: getProportionalHeight(50)!),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(getProportionalWidth(10)!),
              ),
              child: Text(
                "dummyemail@gmail.com",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: getProportionalHeight(30),
            ),
            CustomFormField(
              controller: passwordEditingController,
              hintText: "Enter your password",
              labelText: "Password",
              obsecure: isObsecure,
              isTemperature: false,
              keyBoardType: TextInputType.text,
            ),
            GestureDetector(
              onTap: () {
                print("checkBox clicked");
                setState(() {
                  isObsecure = !isObsecure;
                });
              },
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    },
                    child: Checkbox(
                      checkColor: Colors.white,
                      focusColor: kHeadingColor,
                      activeColor: kHeadingColor,
                      value: !isObsecure,
                      onChanged: (bool? value) {
                        setState(() {
                          isObsecure = !value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: getProportionalWidth(20),
                  ),
                  Text(
                    "Show password",
                    style: TextStyle(
                        color: kHeadingColor, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionalHeight(60),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getProportionalWidth(15)!),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forget password?",
                      style: TextStyle(
                          color: kHeadingColor,
                          fontSize: getProportionalWidth(16),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  CustomButton(
                    height: 50,
                    width: 90,
                    text: "Next",
                    color: kHeadingColor,
                    press: () {
                      print("Next Button Clicked!!!");
                      Navigator.pushNamedAndRemoveUntil(context,
                          DashBaordScreen.routeName, ModalRoute.withName('/'));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
