import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/features/products/cubit/product_cubit.dart';
import 'package:guruh1/features/products/cubit/product_state.dart';
import 'package:guruh1/features/products/models/product_model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (state.products.isEmpty) {
            return Center(child: Text('No products'));
          }
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ListTile(
                onLongPress: () {},
                title: Text(product.name),
                trailing: Row(
                  mainAxisSize: .min,
                  children: [
                    IconButton(
                      onPressed: () {
                        final newProduct = Product(
                          id: product.id,
                          name: "Updated Product",
                          price: product.price,
                          quantity: product.quantity,
                        );
                        context.read<ProductCubit>().updateProduct(newProduct);
                      },
                      icon: state.updatingId == product.id
                          ? CircularProgressIndicator.adaptive()
                          : Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<ProductCubit>().deleteProduct(product.id);
                      },
                      icon: state.deletingId == product.id
                          ? CircularProgressIndicator.adaptive()
                          : Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error!)));
          }
          // else if (state is ) {
          //   ScaffoldMessenger.of(
          //     context,
          //   ).showSnackBar(SnackBar(content: Text(state.message)));
          // }
        },
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              final Product product = Product(
                id: 3,
                name: "Yangi product",
                price: 4.0,
                quantity: 10,
              );
              context.read<ProductCubit>().createProduct(product);
            },
            child: state.isCreating
                ? CircularProgressIndicator.adaptive()
                : Icon(Icons.add),
          );
        },
      ),
    );
  }
}
