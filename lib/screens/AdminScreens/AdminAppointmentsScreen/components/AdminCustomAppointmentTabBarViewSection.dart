import 'package:cuission/components/customOrderStatusCard.dart';
import 'package:cuission/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'AdminCustomAppointmentCard.dart';

class AdminCustomAppointmentTabBarViewSection extends StatelessWidget {
  AdminCustomAppointmentTabBarViewSection({
    Key? key,
    required this.color,
    required this.tabName,
  }) : super(key: key);
  final Color color;
  final String tabName;
  final List<Map<String, dynamic>> orderData = [
    {
      "orderNo": "13144329",
      "orderQty": "7",
    },
    {
      "orderNo": "13144329",
      "orderQty": "5",
    },
    {
      "orderNo": "13144329",
      "orderQty": "2",
    },
    {
      "orderNo": "13144329",
      "orderQty": "15",
    },
    {
      "orderNo": "13144329",
      "orderQty": "21",
    },
    {
      "orderNo": "13144329",
      "orderQty": "2",
    },
  ];

  var TabData = (String tabName, List<Map<String, dynamic>> orderData,
      List<Map<String, dynamic>> tabData) {
    if (tabName == "All") {
      tabData = orderData;
      return tabData;
    }
    // else if (tabName == "Pending") {
    //   tabData = orderData
    //       .where((element) => element.containsValue("Pending"))
    //       .toList();
    //   return tabData;
    // } else if (tabName == "Active") {
    //   tabData = orderData
    //       .where((element) => element.containsValue("Delivered"))
    //       .toList();
    //   return tabData;
    // } else if (tabName == "Rejected") {
    //   tabData = orderData
    //       .where((element) => element.containsValue("Rejected"))
    //       .toList();
    //   return tabData;
    // }
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
              return AdminCustomAppointmentCard(
                OrderQty: tabData![index]['orderQty'],
                orderNo: tabData[index]['orderNo'],
              );
            },
          ),
        ),
      ],
    );
  }
}
