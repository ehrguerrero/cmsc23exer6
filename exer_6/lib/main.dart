import 'package:exer_6/screen/MyCart.dart';
import 'package:exer_6/screen/MyCatalog.dart';
import 'package:exer_6/screen/MyCheckout.dart';
import 'package:flutter/material.dart';
// import 'package:state_management/screen/MyCart.dart';
// import 'package:state_management/screen/MyCatalog.dart';
import 'package:provider/provider.dart';
import 'provider/shoppingcart_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ShoppingCart()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/cart": (context) => const MyCart(),
        "/products": (context) => const MyCatalog(),
        // added checkout route
        "/checkout": (context) => const MyCheckout()
      },
      home: const MyCatalog(),
    );
  }
}
