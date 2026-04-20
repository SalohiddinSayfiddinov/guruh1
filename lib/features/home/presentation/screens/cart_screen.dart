import 'package:flutter/material.dart';
import 'package:guruh1/features/home/presentation/provider/home_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          IconButton(
            onPressed: () => context.read<HomeProvider>().clearCart(),
            icon: Icon(Icons.delete),
          ),
        ],
        actionsPadding: .only(right: 16.0),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          if (provider.cart.isEmpty) {
            return Center(child: Text('Cart is empty'));
          }
          return ListView.separated(
            itemCount: provider.cart.length,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) {
              final product = provider.cart[index].product;
              return ListTile(
                title: Text(product.name),
                trailing: Row(
                  mainAxisSize: .min,
                  children: [
                    IconButton(
                      onPressed: () {
                        provider.removeFromCart(product);
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(provider.cart[index].quantity.toString()),
                    IconButton(
                      onPressed: () {
                        provider.addToCart(product);
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
