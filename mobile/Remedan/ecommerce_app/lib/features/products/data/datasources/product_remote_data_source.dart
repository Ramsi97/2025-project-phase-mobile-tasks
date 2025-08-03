import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  /// Fetches all products from the remote server.
  /// Throws a [ServerException] for any server-related issues.
  Future<List<ProductModel>> getAllProducts();

  /// Fetches a product by its ID from the remote server.
  /// Throws a [NotFoundException] if the product is not found.
  ///
  Future<ProductModel?> getProductById(String id);

  /// Creates a new product on the remote server.
  /// /// Throws a [ServerException] for any server-related issues.
  Future<void> createProduct(ProductModel product);

  /// Updates an existing product on the remote server.
  /// Throws a [ServerException] for any server-related issues.
  Future<void> updateProduct(ProductModel product);

  /// Deletes a product by its ID from the remote server.
  /// Throws a [ServerException] for any server-related issues.
  Future<void> deleteProduct(String id);
}
