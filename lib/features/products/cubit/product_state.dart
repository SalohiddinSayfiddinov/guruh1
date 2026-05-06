import 'package:guruh1/features/products/models/product_model.dart';

class ProductState {
  final bool isLoading;
  final bool isCreating;
  final int? updatingId;
  final int? deletingId;
  final String? error;
  final List<Product> products;

  const ProductState({
    this.isLoading = false,
    this.isCreating = false,
    this.updatingId,
    this.deletingId,
    this.error,
    this.products = const [],
  });

  ProductState copyWith({
    bool? isLoading,
    bool? isCreating,
    int? updatingId,
    int? deletingId,
    String? error,
    List<Product>? products,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      isCreating: isCreating ?? this.isCreating,
      updatingId: updatingId ?? this.updatingId,
      deletingId: deletingId ?? this.deletingId,
      error: error,
      products: products ?? this.products,
    );
  }
}
