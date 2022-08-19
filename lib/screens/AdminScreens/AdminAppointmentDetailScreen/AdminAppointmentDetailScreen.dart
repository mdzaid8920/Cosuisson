import 'package:cuission/components/customButton.dart';
import 'package:cuission/components/customStatusBadge.dart';
import 'package:cuission/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../utils/size_config.dart';

class AdminAppointmentDetailScreen extends StatefulWidget {
  AdminAppointmentDetailScreen({
    Key? key,
    required this.isNewOrder,
    this.orderName = "",
    this.quantity = "",
    this.imgSrc = "",
    this.orderStatus = "",
  }) : super(key: key);
  static String routeName = "/order-detail-screen";
  final bool isNewOrder;
  late String orderName;
  late String quantity;
  late String imgSrc;

  late String orderStatus;

  @override
  State<AdminAppointmentDetailScreen> createState() =>
      _AdminAppointmentDetailScreenState();
}

NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
final List<Map<String, dynamic>> OrderData = [
  {
    "orderName": "Dish",
    "quantity": "3",
  },
  {
    "orderName": "Object with lid",
    "quantity": "4",
  },
];

class _AdminAppointmentDetailScreenState
    extends State<AdminAppointmentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.isNewOrder);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryColor2),
        title: Text(
          "Appointment Details",
          style: TextStyle(
              color: kHeadingColor,
              fontSize: getProportionalWidth(18),
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionalWidth(15)!),
            child: Container(
              alignment: Alignment.center,
              width: getProportionalWidth(35),
              height: getProportionalHeight(35),
              decoration:
                  BoxDecoration(color: kHeadingColor, shape: BoxShape.circle),
              child: Text(
                "Jk",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
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
                            ],
                            style: TextStyle(
                              fontSize: getProportionalWidth(13),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionalHeight(10),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
                child: Row(
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
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
                // child: Column(
                //   children: [
                //     CustomOrderDetailItemCard(),
                //     CustomOrderDetailItemCard(),
                //   ],
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: OrderData.length,
                  itemBuilder: (context, index) {
                    return CustomOrderDetailItemCard(
                      orderName: OrderData[index]["orderName"],
                      Qty: OrderData[index]["quantity"],
                      packageNo: (index + 1).toString(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: getProportionalHeight(30),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
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
                            "Temperature",
                            style: TextStyle(
                                fontSize: getProportionalWidth(15),
                                fontWeight: FontWeight.w600),
                          ),
                          Text("79°C")
                        ],
                      ),
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
            ],
          ),
        ],
      ),
    );
  }
}

class CustomOrderDetailItemCard extends StatelessWidget {
  const CustomOrderDetailItemCard({
    Key? key,
    required this.orderName,
    required this.Qty,
    required this.packageNo,
  }) : super(key: key);
  final String orderName;
  final String Qty;
  final String packageNo;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getProportionalHeight(0)!),
      child: Column(
        children: [
          // Row(
          //   children: [
          //     SvgPicture.asset("assets/icons/package.svg"),
          //     SizedBox(
          //       width: getProportionalWidth(20),
          //     ),
          //     Text(
          //       "Package $packageNo",
          //     ),
          //   ],
          // ),
          Container(
            height: getProportionalHeight(50),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orderName,
                  style: TextStyle(
                    fontSize: getProportionalWidth(14),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("Qty: ${Qty}")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
