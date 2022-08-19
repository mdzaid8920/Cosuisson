import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';


class CustomDashboardCard extends StatelessWidget {
  const CustomDashboardCard({
    Key? key,
    required this.orderNo,
    required this.noOfOrders,
    required this.press,
  }) : super(key: key);
  final String orderNo;
  final String noOfOrders;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          height: getProportionalHeight(125),
          width: getProportionalWidth(148),
          decoration: BoxDecoration(
            color: kHeadingColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderNo,
                style: TextStyle(
                    color: Colors.white, fontSize: getProportionalWidth(8)),
              ),
              Text(
                "$noOfOrders Items",
                style: TextStyle(
                    color: Colors.white, fontSize: getProportionalWidth(18)),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Container(
            width: getProportionalWidth(148),
            height: getProportionalHeight(25),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "View details",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionalWidth(12)),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: getProportionalWidth(12),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}