import 'package:flutter/material.dart';

final List<Map<String, dynamic>> newTestOrderData = [
    {
      "categoryName": "Cylinderical",
      "isSeleceted": false,
      "types": [
        {
          "typeName": "Dish",
          "isSelected": false,
        },
        {
          "typeName": "Bowl",
          "isSelected": false,
        },
        {
          "typeName": "Vase",
          "isSelected": false,
        },
        {
          "typeName": "Mug with Handle",
          "isSelected": false,
        },
        {
          "typeName": "Mug without Handle",
          "isSelected": false,
        },
        {
          "typeName": "Object with lid",
          "isSelected": false,
        },
      ],
    },
    {
      "categoryName": "Quadrilateral",
      "isSeleceted": false,
      "types": [
        {
          "typeName": "Dish",
          "isSelected": false,
        },
        {
          "typeName": "Box with lid",
          "isSelected": false,
        },
        {
          "typeName": "Box without lid",
          "isSelected": false,
        },
        {
          "typeName": "Tile",
          "isSelected": false,
        },
      ],
    },
    {
      "categoryName": "Custom",
      "isSeleceted": false,
      "types": [
        {
          "typeName": "Dish",
          "isSelected": false,
        },
        {
          "typeName": "Box with lid",
          "isSelected": false,
        },
        {
          "typeName": "Box without lid",
          "isSelected": false,
        },
        {
          "typeName": "Tile",
          "isSelected": false,
        },
      ],
    },
  ];
  List<Map<String, dynamic>> typesData = [];
  bool isObjectLidSelected = false;