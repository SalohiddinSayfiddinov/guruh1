import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/core/theme/app_colors.dart';
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
    context.read<ProductCubit>().getProducts();
  }

  void showSizeBottomSheet(final List<String> colors) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: .5,
          maxChildSize: .9,
          builder: (context, scrollController) {
            return ListView.builder(
              controller: scrollController,
              padding: .all(24.0),
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {},
                  // tileColor: selectedIndex = index ,
                  title: Text(colors[0]),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const CircularProgressIndicator.adaptive();
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          } else if (state is ProductsLoaded) {
            final ProductModel product = state.products[1];
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back),
                      ),
                      pinned: false,
                      floating: true,
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 248,
                        child: ListView.separated(
                          scrollDirection: .horizontal,
                          padding: EdgeInsets.all(24),
                          itemCount: product.images.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10.0),
                          itemBuilder: (context, index) {
                            return Image(
                              image: NetworkImage(product.images[index]),
                              width: 161,
                              height: 248,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(24).copyWith(top: 0),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(product.name),
                            Text(product.price.toStringAsFixed(0)),
                            AttributeContainer(
                              onTap: () {},
                              label: Text('Size'),
                              value: 'S',
                            ),
                            AttributeContainer(
                              onTap: () {
                                showSizeBottomSheet(product.colors);
                              },
                              label: CircleAvatar(
                                radius: 8.0,
                                backgroundColor: Color(0xFFB3B68B),
                              ),
                              value: 'S',
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF4F4F4),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              padding: .symmetric(
                                vertical: 18.0,
                                horizontal: 16.0,
                              ),
                              child: Row(
                                children: [
                                  Text('Quantity'),
                                  Spacer(),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.add),
                                      ),
                                      Text('1'),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.remove),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Text(product.description),
                            Text('Shipping & Returns'),
                            Text(
                              'Free standard shipping and free 60-day returns',
                            ),
                            Text('Reviews'),
                            Text('4.5 Ratings'),
                            Text('213 Reviews'),
                          ],
                        ),
                      ),
                    ),
                    SliverList.separated(
                      itemCount: product.reviews.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 12.0);
                      },
                      itemBuilder: (context, index) {
                        final ReviewModel review = product.reviews[index];
                        return Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.grey,
                                  foregroundImage: NetworkImage(
                                    review.userImage,
                                  ),
                                ),
                                Text(review.userName),
                                Spacer(),
                                Row(
                                  mainAxisSize: .min,
                                  children: List.generate(5, (index) {
                                    return Icon(
                                      Icons.star,
                                      color: index < review.stars
                                          ? AppColors.primary
                                          : Colors.grey,
                                    );
                                  }),
                                ),
                              ],
                            ),
                            Text(review.comment),
                            Text(review.date),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 52.0,
                    margin: .symmetric(horizontal: 24.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text("\$${product.price.toStringAsFixed(0)}"),
                          Text('Add to bag'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

class AttributeContainer extends StatelessWidget {
  final void Function()? onTap;
  final Widget label;
  final String value;
  const AttributeContainer({
    super.key,
    this.onTap,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(100),
        ),
        padding: .symmetric(vertical: 18.0, horizontal: 16.0),
        child: Row(
          children: [
            label,
            Spacer(),
            Text(value),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
