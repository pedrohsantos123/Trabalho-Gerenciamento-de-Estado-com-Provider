import 'package:flutter/material.dart';
import 'controllers/cart_controller.dart';
import 'pages/product_page.dart';

void main() {
  runApp(const MiniEcommerceApp());
}

class MiniEcommerceApp extends StatefulWidget {
  const MiniEcommerceApp({super.key});

  @override
  State<MiniEcommerceApp> createState() => _MiniEcommerceAppState();
}

class _MiniEcommerceAppState extends State<MiniEcommerceApp> {
  final CartController _cart = CartController();

  @override
  void dispose() {
    _cart.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini E-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: ProductPage(cart: _cart),
    );
  }
}
