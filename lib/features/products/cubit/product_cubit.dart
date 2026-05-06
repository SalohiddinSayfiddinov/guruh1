import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/features/products/cubit/product_state.dart';
import 'package:guruh1/features/products/models/product_model.dart';
import 'package:guruh1/features/products/repos/products_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState());

  Future<void> loadProducts() async {
    emit(ProductState(isLoading: true));
    await Future.delayed(Duration(seconds: 1));
    emit(
      state.copyWith(isLoading: false, products: ProductsRepo().getProducts()),
    );
  }

  Future<void> createProduct(Product product) async {
    emit(state.copyWith(isCreating: true));
    await Future.delayed(Duration(seconds: 1));
    try {
      await ProductsRepo().saveProduct(product);
      loadProducts();
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isCreating: false));
    }
  }

  Future<void> updateProduct(Product product) async {
    emit(state.copyWith(updatingId: product.id));
    await Future.delayed(Duration(seconds: 1));
    try {
      await ProductsRepo().saveProduct(product);
      loadProducts();
    } catch (e) {
      emit(state.copyWith(updatingId: null, error: e.toString()));
    }
  }

  Future<void> deleteProduct(int productId) async {
    emit(state.copyWith(deletingId: productId));
    await Future.delayed(Duration(seconds: 1));
    try {
      await ProductsRepo().deleteProduct(productId);
      loadProducts();
    } catch (e) {
      emit(state.copyWith(deletingId: null, error: e.toString()));
    }
  }
}
