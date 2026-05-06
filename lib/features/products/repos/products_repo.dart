import 'package:guruh1/features/products/models/product_model.dart';
import 'package:hive_ce_flutter/adapters.dart';

class ProductsRepo {
  final _box = Hive.box<Product>('productsBox');

  List<Product> getProducts() {
    return _box.values.toList();
  }

  Future<void> saveProduct(Product product) async {
    await _box.put(product.id, product);
  }

  Future<void> deleteProduct(int productId) async {
    await _box.delete(productId);
  }
}
