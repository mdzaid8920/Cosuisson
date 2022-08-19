import 'package:cuission/components/customSectionHeading.dart';
import 'package:flutter/material.dart';

import '../../../components/customButton.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class KilnsEditingScreen extends StatefulWidget {
  const KilnsEditingScreen({Key? key}) : super(key: key);
  static String routeName = "/kilns-editing-screen";

  @override
  State<KilnsEditingScreen> createState() => _KilnsEditingScreenState();
}

class _KilnsEditingScreenState extends State<KilnsEditingScreen> {
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    final kilnsData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String name = kilnsData["name"];
    final String quantity = kilnsData["quantity"];
    print(kilnsData);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Kilns Availability",
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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: getProportionalHeight(20),
              ),
              CustomSectionHeading(text: "Availability"),
              SizedBox(
                height: getProportionalHeight(10),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: kHeadingColor,
                        fontSize: getProportionalWidth(16),
                      ),
                    ),
                    Text(
                      quantity,
                      style: TextStyle(
                          fontSize: getProportionalWidth(16),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionalHeight(20),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
                child: Row(
                  children: [
                    Text(
                      "Quantity",
                      style: TextStyle(
                        fontSize: getProportionalWidth(17),
                        color: kHeadingColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: getProportionalWidth(10),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (qty > 0) {
                          setState(() {
                            qty -= 1;
                          });
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: getProportionalHeight(30),
                        width: getProportionalWidth(30),
                        decoration: BoxDecoration(
                          color: kHeadingColor,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "-",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getProportionalWidth(10),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: getProportionalHeight(30),
                      width: getProportionalWidth(80),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kHeadingColor,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(
                          getProportionalWidth(10)!,
                        ),
                      ),
                      child: Text(
                        qty.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: getProportionalWidth(10),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          qty += 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: getProportionalHeight(30),
                        width: getProportionalWidth(30),
                        decoration: BoxDecoration(
                          color: kHeadingColor,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "+",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(getProportionalWidth(10)!),
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              height: getProportionalHeight(60)!,
              width: double.infinity,
              color: kHeadingColor,
              text: "Next",
              press: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
