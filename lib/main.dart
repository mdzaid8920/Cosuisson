import 'package:cuission/screens/OnBoardingScreen/OnBoardingScreen.dart';
import 'package:cuission/utils/constants.dart';
import 'package:cuission/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cuission',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: kTextColor1),
          bodyText2: TextStyle(color: kTextColor2),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black87),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black87),
          elevation: 0,
        ),
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      initialRoute: OnBoardingScreen.routeName,
      routes: routes,
    );
  }
}
