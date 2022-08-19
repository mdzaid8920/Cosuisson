import 'package:cuission/components/CustomFormField.dart';
import 'package:cuission/components/customSectionHeading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import '../../../components/customButton.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import '../../AppointmentsScreen/AppointmentScreen.dart';
import '../../CheckoutScreen/CheckoutScren.dart';

class AddNewAppointmentScreen extends StatefulWidget {
  const AddNewAppointmentScreen({Key? key, required this.screenTitle})
      : super(key: key);
  static String routeName = "/add-new-appointment-screen";
  final String screenTitle;

  @override
  State<AddNewAppointmentScreen> createState() =>
      _AddNewAppointmentScreenState();
}

class _AddNewAppointmentScreenState extends State<AddNewAppointmentScreen> {
  final TextEditingController _hourEditingController = TextEditingController();
  final TextEditingController _minuteEditingController =
      TextEditingController();
  final TextEditingController _secondsEditingController =
      TextEditingController();

  DateTime? selectedDate;
  String? day;
  String? month;
  String? year;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2023));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        print(selectedDate);
        String formattedDate =
            DateFormat('yyyy-MM-dd – kk:mm').format(selectedDate!);
        print(DateFormat.MMMM().format(
          selectedDate!,
        ));
        month = DateFormat.MMMM().format(
          selectedDate!,
        );
        day = DateFormat.d().format(
          selectedDate!,
        );
        year = DateFormat.y().format(
          selectedDate!,
        );
        print(day);
        print(month);
        print(year);
        // print(formattedDate);
        // _testSelectedDate = selectedDate;
      });
    }
  }

  String? btnText = "Add appointment";

  @override
  Widget build(BuildContext context) {
    if (widget.screenTitle == "Edit Appointment") {
      btnText = "Edit appointment";
    }
    print(selectedDate);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.screenTitle,
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
        body: Stack(
          children: [
            ListView(children: [
              SizedBox(
                height: getProportionalHeight(10),
              ),
              CustomSectionHeading(text: "Time"),
              SizedBox(
                height: getProportionalHeight(10),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      controller: _hourEditingController,
                      obsecure: false,
                      labelText: "Hh",
                      hintText: "Hh",
                      isTemperature: false,
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                    child: CustomFormField(
                      controller: _minuteEditingController,
                      obsecure: false,
                      labelText: "Mm",
                      hintText: "Mm",
                      isTemperature: false,
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                    child: CustomFormField(
                      controller: _secondsEditingController,
                      obsecure: false,
                      labelText: "Ss",
                      hintText: "Ss",
                      isTemperature: false,
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionalHeight(20),
              ),
              CustomSectionHeading(text: "Date"),
              selectedDate == null
                  ? GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Container(
                        // alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                            horizontal: getProportionalWidth(20)!),
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionalWidth(20)!),
                        width: double.infinity,
                        height: getProportionalHeight(65),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: kHeadingColor, width: 1.2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Date"),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              color: kHeadingColor,
                            )
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionalWidth(10)!),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomDateShowContainer(text: day),
                          ),
                          Expanded(
                              child: CustomDateShowContainer(
                            text: month,
                          )),
                          Expanded(
                              child: CustomDateShowContainer(
                            text: year,
                          )),
                        ],
                      ),
                    ),
            ]),
            selectedDate == null
                ? Container()
                : Container(
                    padding: EdgeInsets.all(getProportionalWidth(10)!),
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      height: getProportionalHeight(60)!,
                      width: double.infinity,
                      color: kHeadingColor,
                      text: btnText!,
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
                'Appointment added successfully',
                style: TextStyle(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionalHeight(20),
              ),
              Text(
                "User will be notified about the updates through Dashboard or provided Email.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionalWidth(14),
                ),
              ),
              SizedBox(
                height: getProportionalHeight(30),
              ),
              TextButton(
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionalWidth(40)!),
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  side: BorderSide(color: kPrimaryColor, width: 1.2),
                ),
                onPressed: () {
                  print('Conitnue');
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

class CustomDateShowContainer extends StatelessWidget {
  const CustomDateShowContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: getProportionalHeight(60),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: getProportionalWidth(3)!),
      decoration: BoxDecoration(
        border: Border.all(color: kHeadingColor, width: 1.1),
        borderRadius: BorderRadius.circular(getProportionalWidth(10)!),
      ),
      child: Text(
        text!,
        textAlign: TextAlign.center,
        style: TextStyle(color: kHeadingColor),
      ),
    );
  }
}
