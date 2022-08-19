import 'package:cuission/screens/AdminScreens/AdminGoogleSignInScreen/AdminGooglePasswordScreen.dart';
import 'package:cuission/utils/constants.dart';
import 'package:cuission/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../components/CustomFormField.dart';
import '../../../components/customButton.dart';

class AdminGoogleSignInScreen extends StatefulWidget {
  const AdminGoogleSignInScreen({Key? key}) : super(key: key);
  static String routeName = "/google-signin-screen";

  @override
  State<AdminGoogleSignInScreen> createState() => _AdminGoogleSignInScreenState();
}

class _AdminGoogleSignInScreenState extends State<AdminGoogleSignInScreen> {
  final TextEditingController emailEditingController = TextEditingController();
  late bool isLabel = false;

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
              "Sign in",
              style: TextStyle(
                  color: kTextColor1.withOpacity(0.8),
                  fontSize: getProportionalWidth(16),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: getProportionalHeight(20),
            ),
            Text("Use your Google Account"),
            SizedBox(
              height: getProportionalHeight(20),
            ),
            CustomFormField(
              controller: emailEditingController,
              obsecure: false,
              hintText: "Email or phone",
              labelText: "Email or phone",
              isTemperature: false,
              keyBoardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: getProportionalHeight(15),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.topLeft,
                margin:
                    EdgeInsets.symmetric(horizontal: getProportionalWidth(15)!),
                child: Text(
                  "Forget email?",
                  style: TextStyle(
                      color: kHeadingColor, fontWeight: FontWeight.bold),
                ),
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
                  Text(
                    "create account",
                    style: TextStyle(
                        color: kHeadingColor,
                        fontSize: getProportionalWidth(16),
                        fontWeight: FontWeight.bold),
                  ),
                  CustomButton(
                    height: 50,
                    width: 90,
                    text: "Next",
                    color: kHeadingColor,
                    press: () {
                      print("Next Button Clicked!!!");
                      Navigator.push(
                        context,
                        PageTransition(
                            child: AdminGoogleSignInPasswordScreen(),
                            type: PageTransitionType.rightToLeft),
                      );
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
