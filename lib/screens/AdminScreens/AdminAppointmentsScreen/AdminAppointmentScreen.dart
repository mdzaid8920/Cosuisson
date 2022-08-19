import 'package:cuission/screens/AdminScreens/AddNewAppointmentScreen/AddNewAppointmentScreen.dart';
import 'package:cuission/screens/AdminScreens/AdminDashboardScreen/components/AdminCustomOrderTabBarViewSection.dart';
import 'package:cuission/screens/AdminScreens/AdminOrderDetailScreen/components/adminCustomTabBarView.dart';
import 'package:cuission/screens/AdminScreens/Kilns%20Screen/KilnsScreen.dart';
import 'package:cuission/screens/AppointmentsScreen/AppointmentScreen.dart';
import 'package:cuission/screens/NewOrderScreen/NewOrderScreen.dart';
import 'package:cuission/screens/NewOrderScreen/testNewOrderScreen.dart';
import 'package:cuission/screens/OrderDetailScreen/OrderDetailScreen.dart';
import 'package:cuission/utils/constants.dart';
import 'package:cuission/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../components/customDashBoardCard.dart';
import '../../../components/customSectionHeading.dart';
import '../../../components/customTabBarView.dart';
import '../NewKilnScreen/NewKilnScreen.dart';
import 'components/AdminCustomAppointmentTabBarViewSection.dart';

class AdminAppointmentScreen extends StatefulWidget {
  const AdminAppointmentScreen({Key? key}) : super(key: key);
  static String routeName = "/admin-appointment-screen";

  @override
  State<AdminAppointmentScreen> createState() => _AdminAppointmentScreenState();
}

class _AdminAppointmentScreenState extends State<AdminAppointmentScreen>
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
    TabController tabController = TabController(length: 1, vsync: this);
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kPrimaryColor,
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         PageTransition(
      //             child: NewOrderScreen(),
      //             type: PageTransitionType.rightToLeft));
      //   },
      //   child: Icon(Icons.add),
      // ),
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
                      AdminAppointmentScreen.routeName,
                      ModalRoute.withName('/'));
                },
                child: Text(
                  "ORDERS",
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
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, KilnsScreen.routeName, ModalRoute.withName('/'));
                },
                child: Text(
                  "KILNS",
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
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      AdminAppointmentScreen.routeName,
                      ModalRoute.withName('/'));
                },
                child: Text(
                  "APPOINTMENTS",
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
          "APPOINTMENTS",
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: AddNewAppointmentScreen(screenTitle: "Add Appointment"),
                  type: PageTransitionType.rightToLeft));
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionalHeight(20),
          ),
          //
          CustomSectionHeading(text: "Appointments"),
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
                AdminCustomAppointmentTabBarViewSection(
                    color: Colors.blueGrey, tabName: "All"),
                // AdminCustomOrderTabBarViewSection(
                //     color: Colors.red, tabName: "Pending"),
                // AdminCustomOrderTabBarViewSection(
                //     color: Colors.green, tabName: "Active"),
                // AdminCustomOrderTabBarViewSection(
                //     color: Colors.teal, tabName: "Rejected"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
