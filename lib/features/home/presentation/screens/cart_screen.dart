import 'package:flutter/material.dart';
import 'package:guruh1/features/home/presentation/provider/home_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          if (provider.cart.isEmpty) {
            return Center(child: Text('Cart is empty'));
          }
          return ListView.separated(
            itemCount: provider.cart.length,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(provider.cart[index].product.name),
                trailing: Text(provider.cart[index].quantity.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
