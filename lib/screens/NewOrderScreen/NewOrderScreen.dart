import 'package:cuission/components/customButton.dart';
import 'package:cuission/screens/NewOrderScreen/SetTemeratureDropOff%20Screen/TemeratureDropOffScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../components/customSectionHeading.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({Key? key}) : super(key: key);
  static String routeName = "/new-order-screen";
  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  bool isCategorySelected = false;
  bool isTypesSelected = false;
  bool isObjectLidSelected = false;
  bool issecondTypeSelected = false;
  bool isDishSelected = false;
  bool isBowlSelected = false;
  bool isVaseSelected = false;
  bool isMugWithHandleSelected = false;
  bool isObjectWithLidSelected = false;

  // final List<Map<String, dynamic>> categoriesData = [
  //   {
  //     "categoriesName": "Cylindrical",
  //     "objects": {
  //       "objectName": "Dish",
  //       "objectName": "Bowl",
  //       "objectName": "Vase",
  //       "objectName": "Mug with handle",
  //       "objectName": "Mug withou handle",
  //       "objectName": "Object with lid",
  //     }
  //   },
  //   {
  //     "categoriesName": "Quadrilateral",
  //     "objects": {
  //       "objectName": "Dish",
  //       "objectName": "Mug with handle",
  //       "objectName": "Mug withou handle",
  //       "objectName": "Object with lid",
  //     }
  //   },
  //   {
  //     "categoriesName": "Custom",
  //     "objects": {
  //       "objectName": "Dish",
  //       "objectName": "Mug with handle",
  //       "objectName": "Mug withou handle",
  //       "objectName": "Object with lid",
  //     }
  //   },
  // ];

// final List<Map<String,dynamic>> categoriesData = [
//   {
//     "categoryName": "Cylindrical",
//     "objects": {
//       "name"
//     }
//   }
// ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Place a New Order",
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
      body: ListView(
        children: [
          CustomSectionHeading(text: "Categories"),
          SizedBox(
            height: getProportionalHeight(10),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                CustomNewOrderCard(
                  text: "Cylindrical",
                  isSelected: isCategorySelected,
                  isSecondSelected: false,
                  press: () {
                    setState(() {
                      isCategorySelected = true;
                    });
                  },
                ),
                CustomNewOrderCard(
                  text: "Quadrilateral",
                  press: () {},
                  isSelected: false,
                  isSecondSelected: false,
                ),
                CustomNewOrderCard(
                  text: "Custom",
                  press: () {},
                  isSelected: false,
                  isSecondSelected: false,
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          isCategorySelected
              ? CustomSectionHeading(text: "Types")
              : Container(),
          isCategorySelected
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionalWidth(20)!),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    // crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CustomNewOrderCard(
                        text: "Dish",
                        press: () {
                          setState(() {
                            isTypesSelected = true;
                          });
                        },
                        isSelected: isTypesSelected,
                        isSecondSelected: false,
                      ),
                      CustomNewOrderCard(
                        text: "Bowl",
                        press: () {},
                        isSelected: false,
                        isSecondSelected: issecondTypeSelected,
                      ),
                      CustomNewOrderCard(
                        text: "Vase",
                        press: () {},
                        isSelected: false,
                        isSecondSelected: issecondTypeSelected,
                      ),
                      CustomNewOrderCard(
                        text: "Mug with Handle",
                        press: () {},
                        isSelected: false,
                        isSecondSelected: issecondTypeSelected,
                      ),
                      CustomNewOrderCard(
                        text: "Mug without Handle",
                        press: () {},
                        isSelected: false,
                        isSecondSelected: issecondTypeSelected,
                      ),
                      CustomNewOrderCard(
                        text: "Object with lid",
                        press: () {
                          setState(() {
                            isCategorySelected = true;
                            isObjectLidSelected = true;
                            issecondTypeSelected = true;
                          });
                        },
                        isSelected: isObjectLidSelected,
                        isSecondSelected: false,
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionalWidth(20)!)),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          issecondTypeSelected
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionalWidth(0)!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomSectionHeading(text: "Dimentions"),
                          Text(
                            "(Object with lid)",
                            style: TextStyle(
                              fontSize: getProportionalWidth(12),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionalHeight(10),
                      ),
                      CustomNewOrderTextField(isDimentions: true),
                      SizedBox(
                        height: getProportionalHeight(10),
                      ),
                      CustomSectionHeading(text: "Quantity"),
                      SizedBox(
                        height: getProportionalHeight(10),
                      ),
                      CustomNewOrderTextField(isDimentions: false)
                    ],
                  ),
                )
              : Container(),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
            margin: EdgeInsets.all(getProportionalWidth(20)!),
            child: CustomButton(
              height: getProportionalHeight(60)!,
              width: double.infinity,
              text: "Next",
              press: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: TemperatureDropOffScreen(),
                        type: PageTransitionType.rightToLeft));
              },
              color: kHeadingColor,
            ),
          )
        ],
      ),
    );
  }
}

class CustomNewOrderTextField extends StatelessWidget {
  const CustomNewOrderTextField({
    Key? key,
    required this.isDimentions,
  }) : super(key: key);
  final bool isDimentions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: getProportionalWidth(5)!),
              // padding: EdgeInsets.symmetric(
              //     horizontal: getProportionalWidth(5)!),
              height: getProportionalHeight(60),
              width: double.infinity,
              decoration: BoxDecoration(
                  // color: kHeadingColor,
                  border: Border.all(color: kHeadingColor, width: 1),
                  borderRadius:
                      BorderRadius.circular(getProportionalWidth(10)!)),
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: kHeadingColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Padding(
                            padding:
                                EdgeInsets.only(left: getProportionalWidth(5)!),
                            child: Text(
                              isDimentions ? "Diameter" : "Dishes",
                              style:
                                  TextStyle(fontSize: getProportionalWidth(14)),
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: getProportionalWidth(5)!),
                    child: isDimentions ? Text("cm") : Text(""),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: getProportionalWidth(5)!),
              // padding: EdgeInsets.symmetric(
              //     horizontal: getProportionalWidth(5)!),
              height: getProportionalHeight(60),
              width: double.infinity,
              decoration: BoxDecoration(
                  // color: kHeadingColor,
                  border: Border.all(color: kHeadingColor, width: 1),
                  borderRadius:
                      BorderRadius.circular(getProportionalWidth(10)!)),
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: kHeadingColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Padding(
                            padding:
                                EdgeInsets.only(left: getProportionalWidth(5)!),
                            child: Text(
                              isDimentions ? "Height" : "Object with lid",
                              style:
                                  TextStyle(fontSize: getProportionalWidth(14)),
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: getProportionalWidth(5)!),
                    child: isDimentions ? Text("cm") : Text(""),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNewOrderCard extends StatelessWidget {
  CustomNewOrderCard({
    Key? key,
    required this.text,
    required this.press,
    required this.isSelected,
    required this.isSecondSelected,
  }) : super(key: key);
  final String text;
  final bool isSelected;
  final isSecondSelected;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: press,
        child: isSecondSelected
            ? Container(
                margin:
                    EdgeInsets.symmetric(vertical: getProportionalHeight(10)!),
                alignment: Alignment.center,
                // height: getProportionalHeight(99),
                // width: getProportionalWidth(99),
                constraints: BoxConstraints(
                    maxWidth: getProportionalHeight(111)!,
                    maxHeight: getProportionalWidth(110)!),
                decoration: isSelected
                    ? BoxDecoration(
                        color: (isSelected) ? kHeadingColor : Colors.white,
                        border: Border.all(color: kHeadingColor, width: 1),
                        borderRadius:
                            BorderRadius.circular(getProportionalWidth(10)!))
                    : BoxDecoration(
                        color: (isSelected) ? kHeadingColor : Colors.white,
                        border: Border.all(color: kHeadingColor, width: 1),
                        borderRadius:
                            BorderRadius.circular(getProportionalWidth(10)!)),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: isSelected ? Colors.white : kHeadingColor),
                ),
              )
            : Container(
                margin:
                    EdgeInsets.symmetric(vertical: getProportionalHeight(10)!),
                alignment: Alignment.center,
                // height: getProportionalHeight(99),
                // width: getProportionalWidth(99),
                constraints: BoxConstraints(
                    maxWidth: getProportionalHeight(111)!,
                    maxHeight: getProportionalWidth(110)!),
                decoration: isSelected
                    ? BoxDecoration(
                        color: (isSelected) ? kHeadingColor : Colors.white,
                        border: Border.all(color: kHeadingColor, width: 1),
                        borderRadius:
                            BorderRadius.circular(getProportionalWidth(10)!))
                    : BoxDecoration(
                        color:
                            (isSecondSelected) ? kHeadingColor : Colors.white,
                        border: Border.all(color: kHeadingColor, width: 1),
                        borderRadius:
                            BorderRadius.circular(getProportionalWidth(10)!)),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: isSelected ? Colors.white : kHeadingColor),
                ),
              ));
  }
}
