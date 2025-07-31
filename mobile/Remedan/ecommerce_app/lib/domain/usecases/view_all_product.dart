import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ViewAllProduct {
  final ProductRepository repository;

  ViewAllProduct(this.repository);

  Future<List<Product>> call() async {
    return await repository.getAllProducts();
  }
}
