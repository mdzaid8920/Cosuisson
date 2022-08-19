import 'package:cuission/components/customOrderStatusCard.dart';
import 'package:cuission/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomTabBarViewSection extends StatelessWidget {
  CustomTabBarViewSection({
    Key? key,
    required this.color,
    required this.tabName,
  }) : super(key: key);
  final Color color;
  final String tabName;
  final List<Map<String, dynamic>> orderData = [
    {
      "orderNo": "13144329",
      "orderName": "Kiln 905H",
      "orderStatus": "Rejected",
      "imgSrc": "assets/images/image 1.png",
      "badgeColor": "0xff66FF0000",
    },
    {
      "orderNo": "16580857",
      "orderName": "Kiln T3i",
      "orderStatus": "Delivered",
      "imgSrc": "assets/images/image 2.png",
      "badgeColor": "0xff04DC67"
    },
    {
      "orderNo": "15472579",
      "orderName": "Pro Kiln 7",
      "orderStatus": "Pending",
      "imgSrc": "assets/images/image 3.png",
      "badgeColor": "0xffFF9900"
    },
    {
      "orderNo": "43291335",
      "orderName": "Kiln Super",
      "orderStatus": "In transit",
      "imgSrc": "assets/images/image 4.png",
      "badgeColor": "0xff024A8D"
    },
    {
      "orderNo": "95951635",
      "orderName": "Kiln 5",
      "orderStatus": "Delivered",
      "imgSrc": "assets/images/image 5.png",
      "badgeColor": "0xff04DC67"
    },
  ];

  var TabData = (String tabName, List<Map<String, dynamic>> orderData,
      List<Map<String, dynamic>> tabData) {
    if (tabName == "All") {
      tabData = orderData;
      return tabData;
    } else if (tabName == "Pending") {
      tabData = orderData
          .where((element) => element.containsValue("Pending"))
          .toList();
      return tabData;
    } else if (tabName == "Active") {
      tabData = orderData
          .where((element) => element.containsValue("Delivered"))
          .toList();
      return tabData;
    } else if (tabName == "Rejected") {
      tabData = orderData
          .where((element) => element.containsValue("Rejected"))
          .toList();
      return tabData;
    }
  };

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>>? tabData = [];
    tabData = TabData(tabName, orderData, tabData);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding:
                EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
            itemCount: tabData!.length,
            itemBuilder: (context, index) {
              return CustomOrderStatusCard(
                OrderName: tabData![index]['orderName'],
                orderNo: tabData[index]['orderNo'],
                orderStatus: tabData[index]['orderStatus'],
                imgSrc: tabData[index]['imgSrc'],
                badgeColor: tabData[index]["badgeColor"],
              );
            },
          ),
        ),
      ],
    );
  }
}
