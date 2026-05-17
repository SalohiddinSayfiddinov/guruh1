import 'package:guruh1/features/products/models/product_model.dart';

abstract class ProductState {
  const ProductState();
}

class ProductInit extends ProductState {
  const ProductInit();
}

class ProductsLoading extends ProductState {
  const ProductsLoading();
}

class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);
}

class ProductsLoaded extends ProductState {
  final List<ProductModel> products;
  const ProductsLoaded(this.products);
}
