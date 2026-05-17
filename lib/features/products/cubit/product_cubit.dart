import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/features/products/cubit/product_state.dart';
import 'package:guruh1/features/products/repos/products_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductsRepo repo;
  ProductCubit({required this.repo}) : super(ProductInit());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    try {
      final products = await repo.getProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
