import 'package:cuission/components/customStatusBadge.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../utils/size_config.dart';
import '../screens/OrderDetailScreen/OrderDetailScreen.dart';

class CustomOrderStatusCard extends StatelessWidget {
  const CustomOrderStatusCard({
    Key? key,
    required this.orderNo,
    required this.OrderName,
    required this.orderStatus,
    required this.imgSrc,
    required this.badgeColor,
  }) : super(key: key);
  final String orderNo;
  final String OrderName;
  final String orderStatus;
  final String imgSrc;
  final String badgeColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
              child: OrderDetailScreen(
                isNewOrder: false,
                imgSrc: imgSrc,
                orderName: OrderName,
                quantity: "1",
                badgeColor: badgeColor,
                orderStatus: orderStatus,
              ),
              type: PageTransitionType.rightToLeft),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: getProportionalHeight(10)!,
        ),
        height: getProportionalHeight(100),
        width: getProportionalWidth(320),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Colors.black38.withOpacity(0.2),
                spreadRadius: -3,
                offset: Offset(-1, 0)),
          ],
          borderRadius: BorderRadius.circular(getProportionalWidth(10)!),
        ),
        child: Row(
          children: [
            Container(
              width: getProportionalWidth(90),
              height: double.infinity,
              decoration: BoxDecoration(
                // color: kHeadingColor,
                borderRadius: BorderRadius.circular(getProportionalWidth(10)!),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(getProportionalWidth(10)!),
                child: Image.asset(
                  imgSrc,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                padding:
                    EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: getProportionalHeight(5),),
                    Text(
                      "Order #$orderNo",
                      style: TextStyle(
                          fontSize: getProportionalWidth(12),
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          OrderName,
                          style: TextStyle(
                              fontSize: getProportionalWidth(18),
                              fontWeight: FontWeight.w600),
                        ),
                        CustomStatusBadge(
                          color: Color(int.parse(badgeColor)),
                          status: orderStatus,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
