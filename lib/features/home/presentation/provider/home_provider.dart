import 'package:flutter/material.dart';
import 'package:guruh1/features/home/data/data.dart';
import 'package:guruh1/features/home/models/cart.dart';
import 'package:guruh1/features/home/models/product.dart';

class HomeProvider extends ChangeNotifier {
  final List<Product> products = data.map((e) => Product.fromMap(e)).toList();

  final List<Cart> cart = [
    // Cart(quantity: 1, product: Product.fromMap(data[0])),
  ];

  void addToCart(Product product) {
    for (int i = 0; i < cart.length; i++) {
      final item = cart[i];
      if (item.product.id == product.id) {
        final newItem = Cart(quantity: item.quantity + 1, product: product);
        cart[i] = newItem;
        return;
      }
    }
    final item = Cart(quantity: 1, product: product);
    cart.add(item);
  }
}
