import 'package:flutter/material.dart';
import 'package:guruh1/features/home/data/data.dart';
import 'package:guruh1/features/home/models/cart.dart';
import 'package:guruh1/features/home/models/product.dart';

class HomeProvider extends ChangeNotifier {
  final List<Product> products = data.map((e) => Product.fromMap(e)).toList();

  final List<Cart> cart = [];

  void addToCart(Product product) {
    for (int i = 0; i < cart.length; i++) {
      final item = cart[i];
      if (item.product.id == product.id) {
        final newItem = Cart(quantity: item.quantity + 1, product: product);
        cart[i] = newItem;
        notifyListeners();
        return;
      }
    }
    final item = Cart(quantity: 1, product: product);
    cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    for (int i = 0; i < cart.length; i++) {
      final item = cart[i];
      if (item.product.id == product.id) {
        if (item.quantity == 1) {
          cart.removeAt(i);
        } else {
          final newItem = Cart(quantity: item.quantity - 1, product: product);
          cart[i] = newItem;
        }
        notifyListeners();
        return;
      }
    }
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }

  void toggleFavorite(int id) {
    for (int i = 0; i < products.length; i++) {
      final product = products[i];
      if (id == product.id) {
        product.isFavorite = !product.isFavorite;
        notifyListeners();
      }
    }
  }

  void clearFavorites() {
    for (Product product in products) {
      product.isFavorite = false;
    }
    notifyListeners();
  }
}
