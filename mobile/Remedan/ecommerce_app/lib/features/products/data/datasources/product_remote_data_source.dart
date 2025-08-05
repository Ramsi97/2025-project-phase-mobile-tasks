import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
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

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await client.get(
      Uri.parse(
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/products',
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> productList = json.decode(response.body);
      return productList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel?> getProductById(String id) async {
    final response = await client.get(
      Uri.parse(
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id',
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw NotFoundException('Product not found with id: $id');
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> createProduct(ProductModel product) async {
    final response = await client.post(
      Uri.parse(
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/products',
      ),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );

    if (response.statusCode != 201) {
      throw ServerException();
    }
    return Future.value(null);
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    final response = await client.put(
      Uri.parse(
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${product.id}',
      ),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    final response = await client.delete(
      Uri.parse(
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id',
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 204) {
      throw ServerException();
    }
  }
}
