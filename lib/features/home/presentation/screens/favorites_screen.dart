import 'package:flutter/material.dart';
import 'package:guruh1/features/home/presentation/provider/home_provider.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<HomeProvider>().clearFavorites();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          return ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              final product = provider.products[index];
              if (product.isFavorite == true) {
                return ListTile(
                  title: Text(product.name),
                  trailing: IconButton(
                    onPressed: () {
                      provider.toggleFavorite(product.id);
                    },
                    icon: Icon(Icons.favorite, color: Colors.red),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
