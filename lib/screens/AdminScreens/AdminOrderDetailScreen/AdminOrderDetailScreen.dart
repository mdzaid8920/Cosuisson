import 'package:cuission/components/customButton.dart';
import 'package:cuission/components/customStatusBadge.dart';
import 'package:cuission/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../utils/size_config.dart';

class AdminOrderDetailScreen extends StatefulWidget {
  AdminOrderDetailScreen({
    Key? key,
    required this.isNewOrder,
    this.orderName = "",
    this.quantity = "",
    this.imgSrc = "",
    this.badgeColor = "",
    this.orderStatus = "",
  }) : super(key: key);
  static String routeName = "/admin-order-detail-screen";
  final bool isNewOrder;
  late String orderName;
  late String quantity;
  late String imgSrc;
  late String badgeColor;
  late String orderStatus;

  @override
  State<AdminOrderDetailScreen> createState() => _AdminOrderDetailScreenState();
}

NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
final List<Map<String, dynamic>> newOrderData = [
  {
    "orderName": "Pro Kiln 7",
    "quantity": "1",
    "imgSrc": "assets/images/image 4.png"
  },
  {
    "orderName": "Kiln Rio",
    "quantity": "1",
    "imgSrc": "assets/images/image 3.png"
  },
];

class _AdminOrderDetailScreenState extends State<AdminOrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.isNewOrder);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryColor2),
        title: Text(
          "Order Details",
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
          ),
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
                        widget.isNewOrder
                            ? Container()
                            : CustomStatusBadge(
                                color: Color(int.parse(widget.badgeColor)),
                                status: widget.orderStatus)
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
                height: getProportionalHeight(10),
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
                  itemCount: widget.isNewOrder ? newOrderData.length : 1,
                  itemBuilder: (context, index) {
                    return CustomOrderDetailItemCard(
                      orderName: widget.isNewOrder
                          ? newOrderData[index]["orderName"]
                          : widget.orderName,
                      Qty: widget.isNewOrder
                          ? newOrderData[index]["quantity"]
                          : widget.quantity,
                      imgSrc: widget.isNewOrder
                          ? newOrderData[index]["imgSrc"]
                          : widget.imgSrc,
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
                          "€ ${myFormat.format(4000)}",
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
                          "€ ${myFormat.format(4000 + 95)}",
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
          widget.orderStatus == "Pending"
              ? Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(getProportionalWidth(10)!),
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                            height: getProportionalHeight(60)!,
                            width: double.infinity,
                            color: kPrimaryColor,
                            text: "Reject",
                            press: () {}),
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
                            text: "Approve",
                            press: () {}),
                      ),
                    )
                  ],
                )
              : Container()
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
    required this.imgSrc,
    required this.packageNo,
  }) : super(key: key);
  final String orderName;
  final String Qty;
  final String imgSrc;
  final String packageNo;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getProportionalHeight(20)!),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset("assets/icons/package.svg"),
              SizedBox(
                width: getProportionalWidth(20),
              ),
              Text(
                "Package $packageNo",
              ),
            ],
          ),
          Divider(
            color: kHeadingColor,
            thickness: 1.2,
          ),
          Container(
            height: getProportionalHeight(100),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(getProportionalWidth(10)!),
            ),
            child: Row(
              children: [
                Container(
                  width: getProportionalWidth(90),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    // color: kHeadingColor,
                    borderRadius:
                        BorderRadius.circular(getProportionalWidth(10)!),
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(getProportionalWidth(10)!),
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
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionalWidth(10)!),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: getProportionalHeight(5),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              orderName,
                              style: TextStyle(
                                  fontSize: getProportionalWidth(15),
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "€4000",
                              style: TextStyle(
                                fontSize: getProportionalWidth(12),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: getProportionalWidth(70),
                              height: getProportionalHeight(30),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(
                                    getProportionalWidth(7)!),
                              ),
                              child: Text(
                                "Chat now",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: getProportionalWidth(12),
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "Qty: $Qty",
                          style: TextStyle(fontSize: getProportionalWidth(14)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Padding(
//             padding:
//                 EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
//             child: Row(
//               children: [
//                 SvgPicture.asset("assets/icons/package.svg"),
//                 SizedBox(
//                   width: getProportionalWidth(20),
//                 ),
//                 Text(
//                   "Package 1",
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding:
//                 EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
//             child: Divider(
//               color: kHeadingColor,
//               thickness: 1.2,
//             ),
//           ),
//           Padding(
//             padding:
//                 EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
//             child: 
//            Container(
//               height: getProportionalHeight(100),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(getProportionalWidth(10)!),
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     width: getProportionalWidth(90),
//                     height: double.infinity,
//                     decoration: BoxDecoration(
//                       // color: kHeadingColor,
//                       borderRadius:
//                           BorderRadius.circular(getProportionalWidth(10)!),
//                     ),
//                     child: ClipRRect(
//                       borderRadius:
//                           BorderRadius.circular(getProportionalWidth(10)!),
//                       child: Image.asset(
//                         "assets/images/image 1.png",
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       alignment: Alignment.center,
//                       width: double.infinity,
//                       height: double.infinity,
//                       padding: EdgeInsets.symmetric(
//                           horizontal: getProportionalWidth(10)!),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // SizedBox(height: getProportionalHeight(5),),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Pro Kiln 7",
//                                 style: TextStyle(
//                                     fontSize: getProportionalWidth(15),
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               Container(
//                                 alignment: Alignment.center,
//                                 width: getProportionalWidth(70),
//                                 height: getProportionalHeight(30),
//                                 decoration: BoxDecoration(
//                                   color: kPrimaryColor,
//                                   borderRadius: BorderRadius.circular(
//                                       getProportionalWidth(7)!),
//                                 ),
//                                 child: Text(
//                                   "Chat now",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontSize: getProportionalWidth(12),
//                                       color: Colors.white),
//                                 ),
//                               )
//                             ],
//                           ),
//                           Text(
//                             "Qty: 1",
//                             style:
//                                 TextStyle(fontSize: getProportionalWidth(14)),
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
