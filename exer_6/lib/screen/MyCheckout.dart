import "package:flutter/material.dart";
import "../model/Item.dart";
import "package:provider/provider.dart";
import "../provider/shoppingcart_provider.dart";

//added mycheckout screen

class MyCheckout extends StatelessWidget {
  const MyCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getItems(context),
          const Divider(height: 4, color: Colors.black),
        ],
      ),
    );
  }

  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    double totalPrice = 0;

    //added a for loop that will add all the prices for display purposes
    for (var product in products) {
      totalPrice += product.price;
    }

    return products.isEmpty
        ? const Text('No items to checkout!')
        : Expanded(
            child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.food_bank),
                    title: Text(products[index].name),
                    trailing: Text(products[index].price.toString()),
                  );
                },
              )),
              Flexible(
                  child: Center(child: Text("Total Cost to Pay: $totalPrice"))),

              // moved pay now button to conditional so that it wont appear when cart is empty
              Flexible(
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<ShoppingCart>().removeAll();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Payment Successful!"),
                            duration: Duration(seconds: 1, milliseconds: 100),
                          ));
                        },
                        child: const Text("Pay Now!")),
                  ]))),
            ],
          ));
  }
}
