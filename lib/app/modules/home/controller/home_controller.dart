import 'package:flutter/material.dart';
import 'package:food_app/app/modules/home/views/pizza/pizza_page.dart';
import 'package:food_app/app/routings/app_routers.dart';
import 'package:get/get.dart';

import '../models/menu_item_models.dart';
import '../models/product_model.dart';
import '../views/pizza/low_price_page.dart';
import '../views/pizza/popular_page.dart';
import '../views/pizza/reccommended_page.dart';

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
      id: 2,
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
      id: 3,
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
      id: 4,
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
      id: 0,
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
      id: 1,
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

  final List<String> items = [
    'Popular',
    'High Price',
    'Low Price',
    'Recommendation',
    'Closest Distance'
  ];

  final List<Widget> pages = [
    const ReccommendedPage(),
    const PopularPage(),
    const LowPricePage()
  ];

  final RxInt selectedIndex = 0.obs;

  void onMenuItemSelected(int index) {
    selectedIndex.value = index;
  }

  final menuItems = [
    MenuItems(id: 0, text: 'Recommended'),
    MenuItems(id: 1, text: 'Popular'),
    MenuItems(id: 2, text: 'Low Price'),
  ];

  final RxList<Product> cartItems = RxList<Product>([]);

  void addItemToCart(int id) {
    final product = productRestaurants.firstWhere((p) => p.id == id);

    // Cari apakah item dengan id yang sama sudah ada di cart
    bool itemFound = false;
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].id == id) {
        // Item ditemukan, tambahkan quantity-nya
        cartItems[i].quantity++;
        itemFound = true;
        break;
      }
    }

    // Jika item belum ditemukan, tambahka n item baru ke cart
    if (!itemFound) {
      product.quantity = 1;

      cartItems.add(product);
    }
  }

  void removeItemFromCart(int id) {
    final productIndex = cartItems.indexWhere((i) => i.id == id);
    if (productIndex != -1) {
      cartItems.removeAt(productIndex);
    }
  }

  var isLoading = false.obs;

  void increment(Product item) {
    var index = cartItems.indexWhere((i) => i.id == item.id);
    isLoading(true);
    if (index != -1) {
      cartItems[index].quantity++;
    }
    isLoading(false);
  }

  void decrement(Product item) {
    var index = cartItems.indexWhere((i) => i.id == item.id);
    isLoading(true);
    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        removeItemFromCart(cartItems[index].id ?? 0);
      }
    }
    isLoading(false);
  }

  double get totalPriceProduct {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price! * item.quantity;
    }
    isLoading(false);
    return total;
  }
}

class MenuItems {
  final int id;
  final String text;

  MenuItems({required this.id, required this.text});
}
