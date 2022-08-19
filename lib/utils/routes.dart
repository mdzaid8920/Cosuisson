import 'package:cuission/screens/AdminScreens/AddNewAppointmentScreen/AddNewAppointmentScreen.dart';
import 'package:cuission/screens/AdminScreens/AdminAppointmentsScreen/AdminAppointmentScreen.dart';
import 'package:cuission/screens/AdminScreens/AdminDashboardScreen/AdminDashboardScreen.dart';
import 'package:cuission/screens/AdminScreens/Kilns%20Screen/KilnsScreen.dart';
import 'package:cuission/screens/AdminScreens/KilnsEditingScreen/KilnsEditingScreen.dart';
import 'package:cuission/screens/AdminScreens/NewKilnScreen/NewKilnScreen.dart';
import 'package:cuission/screens/DashboardScreen/DashBaordScreen.dart';
import 'package:cuission/screens/GoogleSignInScreen/GoogleSignInScreen.dart';
import 'package:cuission/screens/OnBoardingScreen/OnBoardingScreen.dart';
import 'package:cuission/screens/OrderDetailScreen/OrderDetailScreen.dart';
import 'package:flutter/material.dart';

import '../screens/GoogleSignInScreen/GoogleSigninPasswordScreen/googleSinginPasswordScreen.dart';
import '../screens/SignInMethodsScreen/SignInScreen.dart';
import '../screens/SignInOptionsScreen/SignInOptionsScreen.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
  SignInOptionsScreen.routeName: (context) => SignInOptionsScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  GoogleSignInScreen.routeName: (context) => GoogleSignInScreen(),
  GoogleSignInPasswordScreen.routeName: (context) =>
      GoogleSignInPasswordScreen(),
  DashBaordScreen.routeName: (context) => DashBaordScreen(),
  AdminDashBoardScreen.routeName: (context) => AdminDashBoardScreen(),
  KilnsScreen.routeName: (context) => KilnsScreen(),
  KilnsEditingScreen.routeName: (context) => KilnsEditingScreen(),
  NewKilnScreen.routeName: (context) => NewKilnScreen(),
  AdminAppointmentScreen.routeName: (context) => AdminAppointmentScreen(),
  // AddNewAppointmentScreen.routeName: (context) => AddNewAppointmentScreen(),
  // OrderDetailScreen.routeName: (context) => OrderDetailScreen(),
};
