import 'package:cuission/screens/OrderDetailScreen/OrderDetailScreen.dart';
import 'package:cuission/utils/data.dart';
import 'package:flutter/material.dart';

import '../../components/customSectionHeading.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';

class TestNewOrderScreen extends StatefulWidget {
  const TestNewOrderScreen({Key? key}) : super(key: key);

  @override
  State<TestNewOrderScreen> createState() => _TestNewOrderScreenState();
}

class _TestNewOrderScreenState extends State<TestNewOrderScreen> {
  // final List<Map<String, dynamic>> newOrderData = [
  //   {
  //     "categoryName": "Cylinderical",
  //     "isSeleceted": false,
  //     "types": [
  //       {
  //         "typeName": "Dish",
  //         "isSelected": false,
  //       },
  //       {
  //         "typeName": "Bowl",
  //         "isSelected": false,
  //       },
  //       {
  //         "typeName": "Vase",
  //         "isSelected": false,
  //       },
  //       {
  //         "typeName": "Mug with Handle",
  //         "isSelected": false,
  //       },
  //       {
  //         "typeName": "Mug without Handle",
  //         "isSelected": false,
  //       },
  //       {
  //         "typeName": "Object with lid",
  //         "isSelected": false,
  //       },
  //     ],
  //   },
  //   {
  //     "categoryName": "Quadrilateral",
  //     "isSeleceted": false,
  //     "types": [
  //       {
  //         "typeName": "Dish",
  //         "isSelected": false,
  //       },
  //       {
  //         "typeName": "Box with lid",
  //         "isSelected": false,
  //       },
  //       {
  //         "typeName": "Box without lid",
  //         "isSelected": false,
  //       },
  //       {
  //         "typeName": "Tile",
  //         "isSelected": false,
  //       },
  //     ],
  //   },
  //   {
  //     "categoryName": "Custom",
  //     "isSeleceted": false,
  //     "types": [
  //       {
  //         "typeName": "Dish",
  //         "isSelected": false,
  //       },
  //       {
  //         "typeName": "Box with lid",
  //         "isSelected": false,
  //       },
  //       {
  //         "typeName": "Box without lid",
  //         "isSelected": false,
  //       },
  //       {
  //         "typeName": "Tile",
  //         "isSelected": false,
  //       },
  //     ],
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    typesData = newTestOrderData[0]["types"];

    typesData.forEach(
      (element) {
        print(element);
      },
    );
    return Scaffold(
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
            height: getProportionalHeight(20),
          ),
          Wrap(
            children: newTestOrderData.map(
              (e) {
                // print(e["isSeleceted"]);
                return CustomNewOrderCard(
                  text: e["categoryName"],
                  isSelected: e["isSeleceted"],
                );
              },
            ).toList(),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          CustomSectionHeading(text: "Types"),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          // Wrap(
          //   children: newTestOrderData.map((e) {
          //     if (e["categoryName"] == "Cylinderical" &&
          //         e["isSeleceted"] == true) {
          //       e["types"].map((t) {
          //         print(t);

          //         return Container(
          //           width: 20,
          //           height: 20,
          //           color: Colors.red,
          //         );
          //         print("test");
          //       }).toList();
          //       return CustomTypesCard(text: "Hello", isSelected: false);
          //     } else {
          //       return Container();
          //     }
          //     // return Container();
          //   }).toList(),
          // )
          Wrap(
            children: typesData.map(
              (e) {
                // print(e["isSeleceted"]);
                return CustomTypesCard(
                  text: e["typeName"],
                  isSelected: e["isSelected"],
                  press: (){
                    setState(() {
                      if(e["typeName"] == "Object with lid"){
                        isObjectLidSelected = true;
                      }

                    });
                  },
                  // press: (){
                  //   setState(() {
                  //     e["isSelected"] == true;
                  //     if(e["typeName"] == "Object with lid"){
                  //       isObjectWithLidSelected = true;
                  //     }
                  //   });
                  //   print(isObjectWithLidSelected);
                  // },
                );
              },
            ).toList(),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          isObjectLidSelected
              ? Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                )
              : Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                )
        ],
      ),
    );
  }
}

class CustomTypesCard extends StatefulWidget {
  CustomTypesCard({
    Key? key,
    required this.text,
    required this.isSelected, required this.press,
  }) : super(key: key);
  final String text;
  bool isSelected;
  final VoidCallback press;

  @override
  State<CustomTypesCard> createState() => _CustomTypesCardState();
}

class _CustomTypesCardState extends State<CustomTypesCard> {
  @override
  Widget build(BuildContext context) {
    isObjectLidSelected = false;
    return GestureDetector(
      onTap: () {
        widget.isSelected = true;
        print(widget.isSelected);
        print(widget.text);
        setState(() {
          if (widget.text == "Object with lid") {
            print("yes i am object with lid");
            isObjectLidSelected = true;
          }
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: getProportionalHeight(10)!,
            horizontal: getProportionalWidth(7)!),
        alignment: Alignment.center,
        // height: getProportionalHeight(99),
        // width: getProportionalWidth(99),
        constraints: BoxConstraints(
            maxWidth: getProportionalHeight(111)!,
            maxHeight: getProportionalWidth(110)!),
        decoration: BoxDecoration(
            color: widget.isSelected ? kHeadingColor : Colors.white,
            border: Border.all(color: kHeadingColor, width: 1),
            borderRadius: BorderRadius.circular(getProportionalWidth(10)!)),

        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          overflow: TextOverflow.fade,
          style: TextStyle(
              color: widget.isSelected ? Colors.white : kHeadingColor),
        ),
      ),
    );
  }
}

class CustomNewOrderCard extends StatefulWidget {
  CustomNewOrderCard({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);
  final String text;
  bool isSelected;

  @override
  State<CustomNewOrderCard> createState() => _CustomNewOrderCardState();
}

class _CustomNewOrderCardState extends State<CustomNewOrderCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isSelected = true;

          if (widget.text == "Cylinderical") {
            newTestOrderData[0]["isSeleceted"] = true;
            print(newTestOrderData[0]["isSeleceted"]);
          }
          print(newTestOrderData[0]["categoryName"]);
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: getProportionalHeight(10)!,
            horizontal: getProportionalWidth(7)!),
        alignment: Alignment.center,
        // height: getProportionalHeight(99),
        // width: getProportionalWidth(99),
        constraints: BoxConstraints(
            maxWidth: getProportionalHeight(111)!,
            maxHeight: getProportionalWidth(110)!),
        decoration: BoxDecoration(
            color: widget.isSelected ? kHeadingColor : Colors.white,
            border: Border.all(color: kHeadingColor, width: 1),
            borderRadius: BorderRadius.circular(getProportionalWidth(10)!)),

        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          overflow: TextOverflow.fade,
          style: TextStyle(
              color: widget.isSelected ? Colors.white : kHeadingColor),
        ),
      ),
    );
  }
}
