import 'package:cuission/components/customButton.dart';
import 'package:cuission/screens/PaymentScreen/PaymentScreen.dart';
import 'package:cuission/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import '../../components/customStatusBadge.dart';
import '../../utils/size_config.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({Key? key}) : super(key: key);
  static String routeName = "/checkout-screen";

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
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
      body: Stack(children: [
        ListView(
          children: [
            SizedBox(
              height: getProportionalHeight(20),
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
              height: getProportionalHeight(60),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Order #905BD52",
                        style: TextStyle(
                            color: kHeadingColor,
                            fontSize: getProportionalWidth(12),
                            fontWeight: FontWeight.w600),
                      ),
                      CustomStatusBadge(
                          color: Color(0xffFF9900), status: "Pending")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Placed on ",
                          children: [
                            TextSpan(
                              text: DateFormat.d().format(
                                DateTime.now(),
                              ),
                            ),
                            TextSpan(
                                text: " ${DateFormat.MMMM().format(
                              DateTime.now(),
                            )}"),
                            TextSpan(
                                text: " ${DateFormat.y().format(
                              DateTime.now(),
                            )}"),
                            TextSpan(
                                text: " ${DateFormat.Hms().format(
                              DateTime.now(),
                            )}"),
                          ],
                          style: TextStyle(
                            fontSize: getProportionalWidth(13),
                          ),
                        ),
                      ),
                      Text(
                        "€ ${myFormat.format(4095)}",
                        style: TextStyle(
                            fontSize: getProportionalWidth(18),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionalHeight(30),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/package.svg"),
                      SizedBox(
                        width: getProportionalWidth(20),
                      ),
                      Text(
                        "Package 1",
                      ),
                    ],
                  ),
                  Divider(
                    color: kHeadingColor,
                    thickness: 1.2,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
              child: Column(
                children: [
                  CustomCheckOutCard(
                    itemName: "Dish",
                    price: 2670,
                    qty: "3",
                  ),
                  CustomCheckOutCard(
                    itemName: "Object with lid",
                    price: 4650,
                    qty: "2",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionalHeight(50),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
              child: Container(
                height: getProportionalHeight(100),
                width: double.infinity,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Droff-off Details",
                          style: TextStyle(
                              fontSize: getProportionalWidth(15),
                              fontWeight: FontWeight.w600),
                        ),
                        Text.rich(
                          TextSpan(
                            text: "${DateFormat.d().format(
                              DateTime.now(),
                            )}, ",
                            children: [
                              TextSpan(
                                  text: " ${DateFormat.MMMM().format(
                                DateTime.now(),
                              )},"),
                              TextSpan(
                                  text: " ${DateFormat.y().format(
                                DateTime.now(),
                              )}"),
                            ],
                            style: TextStyle(
                              fontSize: getProportionalWidth(13),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(
                              fontSize: getProportionalWidth(15),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Belgium",
                          style: TextStyle(
                            fontSize: getProportionalWidth(13),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getProportionalHeight(30),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Summary",
                    style: TextStyle(
                        fontSize: getProportionalWidth(15),
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: TextStyle(
                          fontSize: getProportionalWidth(14),
                        ),
                      ),
                      Text(
                        "€ ${myFormat.format(17310)}",
                        style: TextStyle(
                            fontSize: getProportionalWidth(14),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping",
                        style: TextStyle(
                          fontSize: getProportionalWidth(14),
                        ),
                      ),
                      Text(
                        "€ ${myFormat.format(95)}",
                        style: TextStyle(
                            fontSize: getProportionalWidth(14),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    color: kHeadingColor,
                    thickness: 1.2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: getProportionalWidth(14),
                        ),
                      ),
                      Text(
                        "€ ${myFormat.format(17310 + 95)}",
                        style: TextStyle(
                            fontSize: getProportionalWidth(16),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(getProportionalWidth(10)!),
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  height: getProportionalHeight(60)!,
                  width: double.infinity,
                  color: kPrimaryColor,
                  text: "Cancel",
                  press: () {},
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(getProportionalWidth(10)!),
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  height: getProportionalHeight(60)!,
                  width: double.infinity,
                  color: kHeadingColor,
                  text: "Proceed to pay",
                  press: () {
                    Navigator.push(
                  context,
                  PageTransition(
                      child: PaymentScreen(),
                      type: PageTransitionType.rightToLeft),
                );
                  },
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class CustomCheckOutCard extends StatelessWidget {
  CustomCheckOutCard({
    Key? key,
    required this.itemName,
    required this.qty,
    required this.price,
  }) : super(key: key);
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');

  final String itemName;
  final String qty;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionalHeight(40),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: getProportionalWidth(120),
            child: Text(
              itemName,
              style: TextStyle(
                color: kHeadingColor,
                fontSize: getProportionalWidth(15),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: getProportionalWidth(30),
          ),
          Text("Qty: ${qty}"),
          Text(
            "€ ${myFormat.format(price)}",
            style: TextStyle(
              fontSize: getProportionalWidth(15),
            ),
          )
        ],
      ),
    );
  }
}
