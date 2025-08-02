import 'dart:convert';

import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixture/fixture.dart';

void main() {
  const productModel = ProductModel(
    id: '1',
    name: 'Test Product',
    description: 'A product for testing',
    price: 49,
    imageUrl: 'test.png',
  );

  final productJson = json.decode(fixture("product.json"));

  test('should be a subclass of Product entity', () async {
    expect(productModel, isA<ProductModel>());
  });

  test('fromJson should return a valid model', () {
    final result = ProductModel.fromJson(productJson);
    expect(result, productModel);
  });

  test('toJson should return a valid JSON map', () {
    final result = productModel.toJson();
    expect(result, productJson);
  });
}
