import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
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

const CACHED_PRODUCTS = 'CACHED_PRODUCTS';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;
  ProductLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<List<ProductModel>> getCachedProducts() {
    final jsonString = sharedPreferences.getString(CACHED_PRODUCTS);
    if (jsonString != null) {
      final List decoded = json.decode(jsonString);
      final products = decoded.map((e) => ProductModel.fromJson(e)).toList();
      return Future.value(products);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) {
    sharedPreferences.setString(
      CACHED_PRODUCTS,
      json.encode(products.map((e) => e.toJson()).toList()),
    );
    return Future.value();
  }

  @override
  Future<ProductModel?> getProductById(String id) {
    final products = sharedPreferences.getString(CACHED_PRODUCTS);
    if (products != null) {
      final List decoded = json.decode(products);
      final product = decoded
          .map((e) => ProductModel.fromJson(e))
          .firstWhere((p) => p.id == id, orElse: () => null);
      return Future.value(product);
    } else {
      throw CacheException();
    }
  }
}
