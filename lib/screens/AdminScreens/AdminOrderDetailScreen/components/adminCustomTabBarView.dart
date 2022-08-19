import 'package:cuission/components/customOrderStatusCard.dart';
import 'package:cuission/screens/AdminScreens/AdminOrderDetailScreen/components/adminCustomOrderStatusCard.dart';
import 'package:cuission/screens/AdminScreens/KilnsEditingScreen/KilnsEditingScreen.dart';
import 'package:cuission/utils/constants.dart';
import 'package:cuission/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AdminCustomTabBarViewSection extends StatelessWidget {
  AdminCustomTabBarViewSection({
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
  final List<Map<String, dynamic>> cylindericalData = [
    {
      "name": "Dish",
      "quantity": "97",
    },
    {
      "name": "Bowl",
      "quantity": "197",
    },
    {
      "name": "Vase",
      "quantity": "302",
    },
    {
      "name": "Mug with Handle",
      "quantity": "410",
    },
    {
      "name": "Mug without Handle",
      "quantity": "246",
    },
    {
      "name": "Object with lid",
      "quantity": "246",
    },
  ];
  final List<Map<String, dynamic>> quadrilateralData = [
    {
      "name": "Dish",
      "quantity": "97",
    },
    {
      "name": "Box with lid",
      "quantity": "76",
    },
    {
      "name": "Box without lid",
      "quantity": "171",
    },
    {
      "name": "Tile",
      "quantity": "509",
    },
  ];
  final List<Map<String, dynamic>> customData = [
    {
      "name": "Cylinderical",
      "quantity": "179",
    },
    {
      "name": "Quadrilateral",
      "quantity": "579",
    },
  ];

  var TabDataFunction = (
    String tabName,
    List<Map<String, dynamic>> tabData,
    List<Map<String, dynamic>> cylindericalData,
    List<Map<String, dynamic>> quadrilateralData,
    List<Map<String, dynamic>> customData,
  ) {
    if (tabName == "Cylinderical") {
      tabData = cylindericalData;
      return tabData;
    } else if (tabName == "Quadrilateral") {
      tabData = quadrilateralData;
      return tabData;
    } else if (tabName == "Custom") {
      tabData = customData;
      return tabData;
    }
  };
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>>? tabData = [];
    // tabData = TabData(tabName, orderData, tabData);
    tabData = TabDataFunction(
        tabName, tabData, cylindericalData, quadrilateralData, customData);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding:
                EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
            itemCount: tabData!.length,
            itemBuilder: (context, index) {
              return AdminCustomOrderStatusCard(
                name: tabData![index]["name"],
                quantity: tabData[index]["quantity"],
              );
            },
          ),
        ),
      ],
    );
  }
}

class AdminCustomOrderStatusCard extends StatelessWidget {
  const AdminCustomOrderStatusCard({
    Key? key,
    required this.name,
    required this.quantity,
  }) : super(key: key);
  final String name;
  final String quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionalHeight(50),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              color: kHeadingColor,
            ),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                quantity,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: getProportionalWidth(10),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    KilnsEditingScreen.routeName,
                    arguments: <String, dynamic>{
                      "name": name,
                      "quantity": quantity,
                    },
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: getProportionalHeight(25),
                  width: getProportionalWidth(40),
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
                  width: getProportionalWidth(40),
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
          ))
        ],
      ),
    );
  }
}
