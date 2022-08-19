import 'package:cuission/screens/AdminScreens/AdminGoogleSignInScreen/AdminGoogleSignInScreen.dart';
import 'package:cuission/screens/GoogleSignInScreen/GoogleSignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../components/CustomSignInButton.dart';
import '../../../utils/size_config.dart';


class AdminSignInScreen extends StatefulWidget {
  const AdminSignInScreen({Key? key}) : super(key: key);
  static String routeName = "/admin-signin-screen";

  @override
  State<AdminSignInScreen> createState() => _AdminSignInScreenState();
}

class _AdminSignInScreenState extends State<AdminSignInScreen> {
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
                    CustomSigninButton(
                      text: "Signin with Google",
                      svgSrc: "assets/icons/google-icon.svg",
                      press: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              child: AdminGoogleSignInScreen(),
                              type: PageTransitionType.rightToLeft),
                        );
                      },
                    ),
                    SizedBox(
                      height: getProportionalHeight(30),
                    ),
                    CustomSigninButton(
                      text: "Signin with Facebook",
                      svgSrc: "assets/icons/facebook-2.svg",
                      press: () {},
                    )
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


