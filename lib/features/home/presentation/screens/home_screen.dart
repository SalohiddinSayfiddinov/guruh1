import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:guruh1/features/home/presentation/provider/home_provider.dart';
import 'package:guruh1/features/home/presentation/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sabzi AI'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: Icon(Icons.shopping_cart, color: Colors.red),
          ),
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          return GridView.builder(
            padding: .all(16.0),
            itemCount: provider.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              mainAxisExtent: 300,
            ),
            itemBuilder: (context, index) {
              final product = provider.products[index];
              return Container(
                decoration: BoxDecoration(
                 
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(14),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: product.image,
                        fit: .cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(fontWeight: .w700),
                            ),
                            Text(product.category),
                            Text("\$${product.price.toString()}"),
                            ElevatedButton(
                              onPressed: () {
                                provider.addToCart(product);
                              },
                              child: Text('add'),
                            ),
                          ],
                        ),
                      ),
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
