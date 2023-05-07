import 'package:flutter/material.dart';
import 'package:food_app/app/modules/home/views/pizza_page.dart';
import 'package:food_app/app/routings/app_routers.dart';
import 'package:get/get.dart';

import '../models/menu_item_models.dart';
import '../models/product_model.dart';

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

  var tabIndexMenu = RxInt(-1);

  void changeTabIndexMenu(int index) {
    tabIndexMenu.value = index;
  }

  var isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.toggle();
  }

  var menuItem = [
    MenuItem(
      title: "Burger",
      icon: "assets/icons/Burger.png",
    ),
    MenuItem(title: "Donat", icon: "assets/icons/Donat.png"),
    MenuItem(
      title: "Pizza",
      icon: "assets/icons/Pizza.png",
      onTap: () => Get.to(const PizzaPage()),
    ),
    MenuItem(title: "Hot dog", icon: "assets/icons/Hot-dog.png"),
    MenuItem(title: "Cheese", icon: "assets/icons/Cheese.png"),
    MenuItem(title: "Cream", icon: "assets/icons/Ice-cream.png"),
  ];

  var popular = [
    Product(
      foodName: "Pasta",
      imageUrl: 'assets/images/Pasta.png',
      image:
          'assets/images/pasta-fettuccine-bolognese-with-tomato-sauce-white-bowl.jpg',
      description:
          "A type of food usually made from unleavened wheat flour mixed with water or eggs, and formed into sheets or other shapes, then cooked by boiling or baking.",
      rate: 4.5,
      reviewed: 22,
      price: 5.50,
      addOn: ['Pepper Julienned', 'Baby Spinach', 'Masroom'],
      addOnImage: [
        'assets/images/Pepper.png',
        'assets/images/Spinach.png',
        'assets/images/Masroom.png',
      ],
      addOnPrice: [2.30, 4.70, 2.50],
    ),
    Product(
      foodName: "Pizza",
      imageUrl: 'assets/images/Pizza.png',
      image:
          'assets/images/mix-pizza-chicken-tomato-bell-pepper-olives-mushroom-side-view.jpg',
      description:
          "A savory dish originating from Italy, a kind of round and flat dough, which is baked in the oven and usually covered in tomato sauce and cheese with other additional ingredients that can be chosen according to taste. The cheese used is usually mozzarella or pizza cheese,",
      rate: 4.5,
      reviewed: 22,
      price: 8.25,
      addOn: ['Pepper Julienned', 'Baby Spinach', 'Masroom'],
      addOnImage: [
        'assets/images/Pepper.png',
        'assets/images/Spinach.png',
        'assets/images/Masroom.png',
      ],
      addOnPrice: [2.30, 4.70, 2.50],
    ),
    Product(
      foodName: "Hot-dog",
      image: 'assets/images/high-angle-three-hot-dogs-with-salad-sauce.jpg',
      imageUrl: 'assets/images/Hot-dog.jpg',
      description:
          "a type of sausage that is cooked or smoked and has a smoother texture and a milder, wetter taste than most sausages.",
      rate: 4.5,
      reviewed: 22,
      price: 5.50,
      addOn: ['Pepper Julienned', 'Baby Spinach', 'Masroom'],
      addOnImage: [
        'assets/images/Pepper.png',
        'assets/images/Spinach.png',
        'assets/images/Masroom.png',
      ],
      addOnPrice: [2.30, 4.70, 2.50],
    ),
  ];

  void toDetail(int index) {
    if (popular.length > index) {
      var clickedItem = popular[index];
      Get.toNamed(AppRouters.detail, arguments: clickedItem);
    }
  }

  var productRestaurants = [
    Product(
      restaurant: "McDonald's",
      foodName: 'Ground Beef Tacos',
      image: 'assets/images/McDonald.png',
      rate: 4.5,
      reviewed: 22,
      price: 9.5,
      type: ['BURGER', 'CHICKEN', 'FAST FOOD'],
      timeDelivery: '10-15 mins',
      description:
          'Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh  chopped. Spices – chili powder, cumin, onion powder.',
      addOn: ['Pepper Julienned', 'Baby Spinach', 'Masroom'],
      addOnImage: [
        'assets/images/Pepper.png',
        'assets/images/Spinach.png',
        'assets/images/Masroom.png',
      ],
      addOnPrice: [2.30, 4.70, 2.50],
    ),
    Product(
      restaurant: "Starbucks",
      foodName: 'Cheese Beef',
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
        'assets/images/Masroom.png',
      ],
      addOnPrice: [2.30, 4.70, 2.50],
    ),
  ].obs;

  void onItemClick(int index) {
    if (productRestaurants.length > index) {
      var clickedItem = productRestaurants[index];
      Get.toNamed(AppRouters.detail, arguments: clickedItem);
    }
  }

  var count = 0.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 0) {
      count.value--;
    }
  }
}
