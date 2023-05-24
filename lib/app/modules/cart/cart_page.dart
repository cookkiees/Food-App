import 'package:flutter/material.dart';
import 'package:food_app/app/modules/home/controller/home_controller.dart';
import 'package:food_app/app/utils/my_colors.dart';
import 'package:get/get.dart';

class CartPage extends GetView<HomeController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.background,
        elevation: 0,
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/avatar.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(
                () {
                  if (controller.cartItems.isEmpty) {
                    return const Center(
                      child: Text(
                        "-No items in the cart-",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: controller.cartItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          var cartItems = controller.cartItems[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 140,
                                      width: 140,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          cartItems.image.toString(),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartItems.foodName.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(height: 18),
                                        Text(
                                          cartItems.addOn![index],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 32),
                                        Row(
                                          children: [
                                            Text(
                                              "\$${cartItems.price.toString()}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(width: 50),
                                            Row(
                                              children: [
                                                Obx(() => controller
                                                        .isLoading.value
                                                    ? const CircularProgressIndicator()
                                                    : InkWell(
                                                        onTap: () {
                                                          controller.decrement(
                                                              cartItems);
                                                        },
                                                        child: Container(
                                                          height: 26,
                                                          width: 26,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: MyColors
                                                                    .orange),
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.white,
                                                          ),
                                                          child: const Icon(
                                                            Icons.remove,
                                                            size: 24.0,
                                                            color:
                                                                MyColors.orange,
                                                          ),
                                                        ),
                                                      )),
                                                const SizedBox(width: 8),
                                                Obx(() => controller
                                                        .isLoading.value
                                                    ? const CircularProgressIndicator()
                                                    : Text(
                                                        '${cartItems.quantity < 10 ? '0' : ''}${cartItems.quantity}',
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                        ),
                                                      )),
                                                const SizedBox(width: 8),
                                                Obx(
                                                  () => controller
                                                          .isLoading.value
                                                      ? const CircularProgressIndicator()
                                                      : InkWell(
                                                          onTap: () {
                                                            controller
                                                                .increment(
                                                                    cartItems);
                                                          },
                                                          child:
                                                              const CircleAvatar(
                                                            radius: 14.0,
                                                            backgroundColor:
                                                                MyColors.orange,
                                                            child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller
                                        .removeItemFromCart(cartItems.id ?? 0);
                                  },
                                  icon: const Icon(
                                    Icons.clear,
                                    size: 24.0,
                                    color: MyColors.orange,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
      bottomSheet: SizedBox(
        height: 350,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ListTile(
              dense: true,
              title: const Text(
                "Subtotal",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Obx(() => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : Text("\$ ${controller.totalPriceProduct.toString()} USD")),
            ),
            const Divider(),
            const ListTile(
              dense: true,
              title: Text("Tax and Fees",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text('\$ 0.0 USD'),
            ),
            const Divider(),
            const ListTile(
              dense: true,
              title: Text("Delivery",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text('\$ 0.0 USD'),
            ),
            const Divider(),
            ListTile(
              dense: true,
              title: Text("Total : ${controller.cartItems.length} items",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: Obx(() => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : Text("\$ ${controller.totalPriceProduct.toString()} USD")),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                minimumSize: const Size(300, 50),
                backgroundColor: MyColors.orange,
              ),
              onPressed: () {},
              child: const Text("CHECKOUT"),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
