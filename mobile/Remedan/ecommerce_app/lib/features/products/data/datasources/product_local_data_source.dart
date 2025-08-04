import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  /// Gets the cached products from local storage.
  /// Throws [CacheException] if no cached data is present.

  Future<List<ProductModel>> getCachedProducts();

  /// Caches the given products in local storage.
  /// Throws [CacheException] if caching fails.
  Future<void> cacheProducts(List<ProductModel> products);

  Future<ProductModel?> getProductById(String id);
}
