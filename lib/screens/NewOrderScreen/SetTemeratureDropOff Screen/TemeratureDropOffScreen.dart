import 'package:cuission/components/CustomFormField.dart';
import 'package:cuission/main.dart';
import 'package:cuission/screens/AppointmentsScreen/AppointmentScreen.dart';
import 'package:cuission/screens/CheckoutScreen/CheckoutScren.dart';
import 'package:flutter/material.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:page_transition/page_transition.dart';

import '../../../components/customButton.dart';
import '../../../components/customSectionHeading.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class TemperatureDropOffScreen extends StatefulWidget {
  const TemperatureDropOffScreen({Key? key}) : super(key: key);
  static String routeName = "/temperature-DropOff-Screen";
  @override
  State<TemperatureDropOffScreen> createState() =>
      _TemperatureDropOffScreenState();
}

class _TemperatureDropOffScreenState extends State<TemperatureDropOffScreen> {
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _temperatureDayController =
      TextEditingController();
  final TextEditingController _temperatureYearController =
      TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  final List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  final List<String> _countries = [
    "Belgium",
  ];

  late String currentMonth = _months[0];
  late String currentCountry = "Select Country";
  _showCountryChoiceDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          // final _singleNotifier = Provider.of<SingleNotifier>(context);
          return AlertDialog(
            // title: Text('Select one Month'),
            // backgroundColor: Color(0xff242424),
            content: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: _countries
                      .map(
                        (e) => RadioListTile(
                          activeColor: Colors.red,
                          dense: false,
                          // tileColor: Color(0xff242424),
                          title: Text(e),
                          value: e,
                          groupValue: currentMonth,
                          selected: currentMonth == e,
                          onChanged: (value) {
                            currentCountry = value as String;
                            print(currentCountry);
                            setState(() {
                              currentCountry = value as String;
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        },
      );
  _showMonthChoiceDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          // final _singleNotifier = Provider.of<SingleNotifier>(context);
          return AlertDialog(
            // title: Text('Select one Month'),
            // backgroundColor: Color(0xff242424),
            content: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: _months
                      .map(
                        (e) => RadioListTile(
                          activeColor: Colors.red,
                          dense: false,
                          // tileColor: Color(0xff242424),
                          title: Text(e),
                          value: e,
                          groupValue: currentMonth,
                          selected: currentMonth == e,
                          onChanged: (value) {
                            currentMonth = value as String;
                            print(currentMonth);
                            setState(() {
                              currentMonth = value as String;
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    DropdownDatePicker();
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
        body: Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: getProportionalHeight(20),
                ),
                CustomSectionHeading(text: "Set temperature"),
                SizedBox(
                  height: getProportionalHeight(20),
                ),
                CustomFormField(
                    controller: _temperatureController,
                    obsecure: false,
                    labelText: "Set temperature",
                    hintText: "Set temperature",
                    isTemperature: true,
                    keyBoardType: TextInputType.number),
                SizedBox(
                  height: getProportionalHeight(20),
                ),
                CustomSectionHeading(text: "Drop-Off Details"),
                SizedBox(
                  height: getProportionalHeight(20),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomFormField(
                          controller: _temperatureDayController,
                          obsecure: false,
                          labelText: "Day",
                          hintText: "Day",
                          isTemperature: false,
                          keyBoardType: TextInputType.number),
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        _showMonthChoiceDialog(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: getProportionalHeight(65),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: kHeadingColor, width: 1.2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${currentMonth}"),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                      child: CustomFormField(
                          controller: _temperatureYearController,
                          obsecure: false,
                          labelText: "Year",
                          hintText: "Year",
                          isTemperature: false,
                          keyBoardType: TextInputType.number),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionalHeight(20),
                ),
                GestureDetector(
                  onTap: () {
                    _showCountryChoiceDialog(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: getProportionalWidth(20)!),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: getProportionalHeight(65),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kHeadingColor, width: 1.2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${currentCountry}"),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(getProportionalWidth(20)!),
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                height: getProportionalHeight(60)!,
                width: double.infinity,
                color: kHeadingColor,
                text: "Continue",
                press: () {
                  _showMyDialog(context);
                },
              ),
            )
          ],
        ));
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionalWidth(20)!,
            vertical: getProportionalWidth(50)!),
        backgroundColor: Color(0xff242424),
        contentTextStyle:
            TextStyle(color: Colors.white, fontSize: getProportionalWidth(16)),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Changes saved. Do you want to see available appointments?',
                style: TextStyle(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionalHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text(
                      'No',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      side: BorderSide(color: kPrimaryColor, width: 1.2),
                    ),
                    onPressed: () {
                      print('No');
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          PageTransition(
                              child: CheckoutScreen(),
                              type: PageTransitionType.rightToLeft));
                    },
                  ),
                  SizedBox(
                    width: getProportionalWidth(20),
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      side: BorderSide(color: kPrimaryColor, width: 1.2),
                    ),
                    onPressed: () {
                      print('Yes');
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          PageTransition(
                              child: AppointmentsScreen(),
                              type: PageTransitionType.rightToLeft));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        // actions: <Widget>[
        //   TextButton(
        //     child: Text('Confirm'),
        //     onPressed: () {
        //       print('Confirmed');
        //       Navigator.of(context).pop();
        //     },
        //   ),
        //   TextButton(
        //     child: Text('Cancel'),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ],
      );
    },
  );
}
