import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../components/customButton.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import '../CheckoutScreen/CheckoutScren.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);
  static String routeName = "/appointment-screen";
  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  final List<Map<String, dynamic>> appointmentData = [
    {
      "orderNo": "49055311",
      "temperature": "79",
      "dropDate": "31/7/2022",
    },
    {
      "orderNo": "49055311",
      "temperature": "79",
      "dropDate": "31/7/2022",
    },
    {
      "orderNo": "49055311",
      "temperature": "79",
      "dropDate": "31/7/2022",
    },
    {
      "orderNo": "49055311",
      "temperature": "79",
      "dropDate": "31/7/2022",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appointments",
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
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: getProportionalHeight(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionalWidth(20)!,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order ID",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: getProportionalWidth(100),
                      // color: Colors.red,
                      child: Text(
                        "Temperature",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      "Drop-Off date",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionalHeight(20),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: appointmentData.length,
                  itemBuilder: (context, index) {
                    return CustomAppointmentCard(
                      orderNo: appointmentData[index]['orderNo'],
                      temp: appointmentData[index]['temperature'],
                      date: "dropDate",
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(getProportionalWidth(20)!),
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              height: getProportionalHeight(60)!,
              width: double.infinity,
              color: kHeadingColor,
              text: "Continue",
              press: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: CheckoutScreen(),
                      type: PageTransitionType.rightToLeft),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppointmentCard extends StatelessWidget {
  const CustomAppointmentCard({
    Key? key,
    required this.orderNo,
    required this.temp,
    required this.date,
  }) : super(key: key);
  final String orderNo;
  final String temp;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
      margin: EdgeInsets.symmetric(vertical: getProportionalHeight(10)!),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "#45252111",
            style: TextStyle(
              fontSize: getProportionalWidth(13),
            ),
          ),
          Container(
            width: getProportionalWidth(130),
            child: Text(
              "79",
              style: TextStyle(
                fontSize: getProportionalWidth(13),
              ),
            ),
          ),
          Text(
            "31/7/2022",
            style: TextStyle(
              fontSize: getProportionalWidth(13),
            ),
          ),
        ],
      ),
    );
  }
}
