import 'package:cuission/components/customStatusBadge.dart';
import 'package:cuission/screens/AdminScreens/AddNewAppointmentScreen/AddNewAppointmentScreen.dart';
import 'package:cuission/screens/AdminScreens/AdminAppointmentDetailScreen/AdminAppointmentDetailScreen.dart';
import 'package:cuission/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../utils/size_config.dart';
import '../../../OrderDetailScreen/OrderDetailScreen.dart';

class AdminCustomAppointmentCard extends StatelessWidget {
  AdminCustomAppointmentCard({
    Key? key,
    required this.orderNo,
    required this.OrderQty,
  }) : super(key: key);
  final String orderNo;
  final String OrderQty;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
              child: AdminAppointmentDetailScreen(
                isNewOrder: false,
                imgSrc: "imgSrc",
                orderName: "OrderName",
                quantity: "1",
                orderStatus: "orderStatus",
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
                offset: Offset(3, 2)),
          ],
          borderRadius: BorderRadius.circular(getProportionalWidth(10)!),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order #${orderNo}",
                  ),
                  Text(
                    "${OrderQty} items",
                    style: TextStyle(
                      fontSize: getProportionalWidth(18),
                      color: kHeadingColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: AddNewAppointmentScreen(screenTitle: "Edit Appointment"),
                              type: PageTransitionType.rightToLeft));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: getProportionalHeight(25),
                      width: getProportionalWidth(50),
                      decoration: BoxDecoration(
                        color: Color(
                          0xff04DC67,
                        ).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: getProportionalWidth(14),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getProportionalWidth(10),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: getProportionalHeight(25),
                      width: getProportionalWidth(50),
                      decoration: BoxDecoration(
                        color: Color(
                          0xff66FF0000,
                        ).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: getProportionalWidth(14),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
