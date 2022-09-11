# cuission

A new Flutter project.

## **Code Review** ##

#### **Naming Conventions** ####
Folder or File name should be in small letters, more than two words separating with underscore like **profile**, **profile_screen.dart**

#### **Function and Variable's Scope** ####
The scope of a global function or variable should be **private**, meaning it should only be used within the class in which it is defined.
e.g.

    DateTime? _selectedDate;
    Future<void> _selectDate(BuildContext , ){}

 ### Follow Flutter Linting Rules ###

To create better performance applications, always follow to the flutter lining rules.

* Use debugPrint() or log() over print statements
* Use the const keyword before any widget whenever possible
* Your spacing widgets should be constant like const SizedBox(height:20). It will have the same value for all screen sizes.

_There are 431 warnings the Flutter compiler is giving and you skipped them_

### Import statements ###

The import statements should always follow this guide line from top to bottom

_import 'dart:io';_ **Language specific imports**

import 'package:flutter/material.dart'; **Framework specific imports**

import 'package:page_transition/page_transition.dart'; **Plugin or Dependency...**

import 'package:cuission/utils/constants.dart'; **File ...**

import 'components/admin_custom_order_tab_view.dart'; **Your project's package or plugin's...**

 >  __Business Logic should always be separate from UI__

 >  __Use a state management tool to manage your app's state for medium or Large Scale applications__