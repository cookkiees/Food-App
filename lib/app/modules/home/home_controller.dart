import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/menu_item_models.dart';
import 'models/product_model.dart';

class HomeController extends GetxController {
  late FocusNode myFocusNode;
  var isFocused = false.obs;

  @override
  void onInit() {
    myFocusNode = FocusNode();
    myFocusNode.addListener(() {
      isFocused.value = myFocusNode.hasFocus;
    });
    super.onInit();
  }

  @override
  void onClose() {
    myFocusNode.dispose();
    super.onClose();
  }

  var tabIndex = RxInt(-1);

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  var menuItem = [
    MenuItem(title: "Burger", icon: "assets/icons/Burger.png"),
    MenuItem(title: "Donat", icon: "assets/icons/Donat.png"),
    MenuItem(title: "Pizza", icon: "assets/icons/Pizza.png"),
    MenuItem(title: "Hot dog", icon: "assets/icons/Hot-dog.png"),
    MenuItem(title: "Cheese", icon: "assets/icons/Cheese.png"),
    MenuItem(title: "Cream", icon: "assets/icons/Ice-cream.png"),
  ];

  var popular = [
    Product(
        foodName: "Pasta",
        image: 'assets/images/Pasta.png',
        rate: 4.5,
        reviewed: 22,
        price: 5.50,
        addOn: ['Extra Spicy']),
    Product(
        foodName: "Cheese Pizza",
        image: 'assets/images/Pizza.png',
        rate: 4.5,
        reviewed: 22,
        price: 8.25,
        addOn: ['Extra Cheese']),
    Product(
        foodName: "Pasta",
        image: 'assets/images/Pasta.png',
        rate: 4.5,
        reviewed: 22,
        price: 5.50,
        addOn: ['Extra Spicy']),
  ];

  var productRestaurants = [
    Product(
      restaurant: "McDonald's",
      image: 'assets/images/McDonald.png',
      rate: 4.5,
      reviewed: 22,
      price: 9.5,
      type: ['BURGER', 'CHICKEN', 'FAST FOOD'],
      timeDelivery: '10-15 mins',
      description:
          'Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh  chopped. Spices – chili powder, cumin, onion powder.',
      addOn: ['Pepper Julienned', 'Baby Spinach', 'Masroom'],
      addOnImage: [],
      addOnPrice: [2.30, 4.70, 2.50],
    ),
    Product(
      restaurant: "Starbucks",
      image: 'assets/images/Starbucks.png',
      rate: 4.7,
      reviewed: 99,
      price: 9.9,
      type: ['CHEESE', 'CHICKEN', 'FAST FOOD'],
      timeDelivery: '10-18 mins',
      description:
          'Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh  chopped. Spices – chili powder, cumin, onion powder.',
      addOn: ['Pepper Julienned', 'Baby Spinach', 'Masroom'],
      addOnImage: [
        'assets/images/Pepper.png',
        'assets/images/Spinach.png',
        'assets/images/Masroom.png'
      ],
      addOnPrice: [2.30, 4.70, 2.50],
    ),
  ];
}
