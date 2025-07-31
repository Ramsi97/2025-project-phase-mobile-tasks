import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const productModel = ProductModel(
    id: '1',
    name: 'Test Product',
    description: 'A product for testing',
    price: 49.99,
    imageUrl: 'test.png',
  );

  final productJson = {
    'id': '1',
    'name': 'Test Product',
    'description': 'A product for testing',
    'price': 49.99,
    'imageUrl': 'test.png',
  };

  test('fromJson should return a valid model', () {
    final result = ProductModel.fromJson(productJson);
    expect(result, equals(productModel));
  });

  test('toJson should return a valid JSON map', () {
    final result = productModel.toJson();
    expect(result, productJson);
  });
}
