import 'package:cuission/screens/AdminScreens/AdminDashboardScreen/components/AdminCustomOrderTabBarViewSection.dart';
import 'package:cuission/screens/NewOrderScreen/NewOrderScreen.dart';
import 'package:cuission/screens/NewOrderScreen/testNewOrderScreen.dart';
import 'package:cuission/screens/OrderDetailScreen/OrderDetailScreen.dart';
import 'package:cuission/utils/constants.dart';
import 'package:cuission/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../components/customDashBoardCard.dart';
import '../../components/customSectionHeading.dart';
import '../../components/customStatusBadge.dart';
import '../../components/customTabBarView.dart';

class DashBaordScreen extends StatefulWidget {
  const DashBaordScreen({Key? key}) : super(key: key);
  static String routeName = "/dashboard-screen";

  @override
  State<DashBaordScreen> createState() => _DashBaordScreenState();
}

class _DashBaordScreenState extends State<DashBaordScreen>
    with TickerProviderStateMixin {
  final List<Map<String, dynamic>> orderData = [
    {
      "orderNo": "13144329",
      "orderName": "Kiln 905H",
      "orderStatus": "Rejected",
    },
    {
      "orderNo": "16580857",
      "orderName": "Kiln T3i",
      "orderStatus": "Delivered",
    },
    {
      "orderNo": "15472579",
      "orderName": "Pro Kiln 7",
      "orderStatus": "Pending",
    },
    {
      "orderNo": "43291335",
      "orderName": "Kiln Super",
      "orderStatus": "In transit",
    },
    {
      "orderNo": "95951635",
      "orderName": "Kiln 5",
      "orderStatus": "Delivered",
    },
  ];
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: NewOrderScreen(),
                  type: PageTransitionType.rightToLeft));
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        backgroundColor: kPrimaryColor,
        child: Padding(
          padding: EdgeInsets.only(
            left: getProportionalWidth(50)!,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      DashBaordScreen.routeName,
                      ModalRoute.withName('/'));
                },
                child: Text(
                  "DASHBOARD",
                  style: TextStyle(
                    fontSize: getProportionalWidth(18),
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionalHeight(20),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "ABOUT",
                  style: TextStyle(
                    fontSize: getProportionalWidth(18),
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionalHeight(20),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "TERMS AND CONDITIONS",
                  style: TextStyle(
                    fontSize: getProportionalWidth(18),
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Dashboard",
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
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionalHeight(20),
          ),
          CustomSectionHeading(text: "New"),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomDashboardCard(
                    orderNo: "#905BD52",
                    noOfOrders: "3",
                    press: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: OrderDetailScreen(isNewOrder: true),
                            type: PageTransitionType.rightToLeft),
                      );
                    }),
                CustomDashboardCard(
                  orderNo: "#905BD52",
                  noOfOrders: "5",
                  press: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          child: OrderDetailScreen(isNewOrder: true),
                          type: PageTransitionType.rightToLeft),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          CustomSectionHeading(text: "My Orders"),
          SizedBox(
            height: getProportionalHeight(5),
          ),
          Container(
            width: double.infinity,
            height: getProportionalHeight(60),
            margin: EdgeInsets.only(
                left: getProportionalWidth(20)!,
                right: getProportionalWidth(50)!),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: kHeadingColor, width: 0.5),
              ),
            ),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                indicator: const BoxDecoration(
                  // color: kHeadingColor,
                  border: Border(
                    bottom: BorderSide(
                      color: kHeadingColor,
                      width: 3,
                    ),
                    // left: BorderSide(color: Colors.white),
                    // right: BorderSide(color: Colors.white),
                  ),
                ),
                controller: tabController,
                tabs: const [
                  Tab(
                    child: Text(
                      "All",
                      style: TextStyle(color: kHeadingColor),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Pending",
                      style: TextStyle(color: kHeadingColor),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Active",
                      style: TextStyle(color: kHeadingColor),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Rejected",
                      style: TextStyle(color: kHeadingColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: tabController,
              children: [
                CustomTabBarViewSection(color: Colors.blueGrey, tabName: "All"),
                CustomTabBarViewSection(color: Colors.red, tabName: "Pending"),
                CustomTabBarViewSection(color: Colors.green, tabName: "Active"),
                CustomTabBarViewSection(
                    color: Colors.teal, tabName: "Rejected"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
