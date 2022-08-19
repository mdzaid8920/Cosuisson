import 'package:cuission/components/CustomSignInButton.dart';
import 'package:cuission/screens/PaymentScreen/paymentSubScreens/PaymentSubScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constants.dart';
import '../../utils/size_config.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static String routeName = "/payment-screen";

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment",
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
      body: Center(
          child: CustomSigninButton(
        svgSrc: "assets/icons/stripe logo.svg",
        text: "Pay with Stripe",
        press: () {
          Navigator.push(
            context,
            PageTransition(
                child: PaymentFormScreen(),
                type: PageTransitionType.rightToLeft),
          );
        },
      )),
    );
  }
}
