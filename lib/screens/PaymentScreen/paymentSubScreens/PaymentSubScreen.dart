import 'package:cuission/components/CustomFormField.dart';
import 'package:cuission/components/customButton.dart';
import 'package:cuission/screens/PaymentScreen/paymentSubScreens/PaymentVerificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class PaymentFormScreen extends StatefulWidget {
  const PaymentFormScreen({Key? key}) : super(key: key);

  @override
  State<PaymentFormScreen> createState() => PaymentFormScreenState();
}

class PaymentFormScreenState extends State<PaymentFormScreen> {
  final TextEditingController _paymentNameController = TextEditingController();
  final TextEditingController _paymentEmailController = TextEditingController();
  final TextEditingController _paymentCityController = TextEditingController();
  final TextEditingController _paymentPostalController =
      TextEditingController();
  final TextEditingController _paymentCardNoController =
      TextEditingController();
  final TextEditingController _paymentExpiryDateController =
      TextEditingController();
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
          CustomFormField(
            controller: _paymentNameController,
            obsecure: false,
            labelText: "Full Name",
            hintText: "Full Name",
            isTemperature: false,
            keyBoardType: TextInputType.name,
          ),
          SizedBox(
            height: getProportionalHeight(30),
          ),
          CustomFormField(
            controller: _paymentEmailController,
            obsecure: false,
            labelText: "Email address",
            hintText: "Email address",
            isTemperature: false,
            keyBoardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: getProportionalHeight(30),
          ),
          Row(
            children: [
              Expanded(
                child: CustomFormField(
                  controller: _paymentCityController,
                  obsecure: false,
                  labelText: "City",
                  hintText: "City",
                  isTemperature: false,
                  keyBoardType: TextInputType.name,
                ),
              ),
              Expanded(
                child: CustomFormField(
                  controller: _paymentPostalController,
                  hintText: "Postal Code",
                  labelText: "Postal Code",
                  obsecure: false,
                  isTemperature: false,
                  keyBoardType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionalHeight(30),
          ),
          CustomFormField(
            controller: _paymentCardNoController,
            obsecure: false,
            labelText: "Card number",
            hintText: "Card number",
            isTemperature: false,
            keyBoardType: TextInputType.number,
          ),
          SizedBox(
            height: getProportionalHeight(30),
          ),
          CustomFormField(
            controller: _paymentExpiryDateController,
            obsecure: false,
            labelText: "Expiry date",
            hintText: "Expiry date",
            isTemperature: false,
            keyBoardType: TextInputType.datetime,
          ),
          SizedBox(
            height: getProportionalHeight(40),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionalWidth(20)!,
            ),
            child: CustomButton(
                height: getProportionalHeight(60)!,
                width: double.infinity,
                text: "Pay €17,355",
                press: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: PaymentVerificationScreen(),
                        type: PageTransitionType.rightToLeft),
                  );
                },
                color: kHeadingColor),
          )
        ],
      ),
    );
  }
}
