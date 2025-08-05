import 'dart:convert';

import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/features/products/data/datasources/product_local_data_source.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../mocks/mock_test.mocks.dart';

import '../../../../fixture/fixture.dart';

// class MockShredPreferences extends Mock implements SharedPreferences {}

void main() {
  late ProductLocalDataSourceImpl localDataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDataSource = ProductLocalDataSourceImpl(mockSharedPreferences);
  });

  final tProductModel = ProductModel.fromJson(
    json.decode(fixture('product.json')),
  );
  final tProductModels = [tProductModel];

  group('getCachedProduct', () {
    test('should return a chached data when there is one', () async {
      // Arrange

      final tProductModels = [tProductModel];

      when(
        mockSharedPreferences.getString(CACHED_PRODUCTS),
      ).thenReturn(json.encode(tProductModels.map((e) => e.toJson()).toList()));

      // Act
      final result = await localDataSource.getCachedProducts();

      // Assert
      expect(result, [tProductModel]);
      verify(mockSharedPreferences.getString(CACHED_PRODUCTS));
    });

    test(
      'should throw a CacheException when there is no cached data',
      () async {
        // Arrange
        when(mockSharedPreferences.getString(CACHED_PRODUCTS)).thenReturn(null);

        // Act & Assert
        await expectLater(
          () => localDataSource.getCachedProducts(),
          throwsA(isA<CacheException>()),
        );

        verify(mockSharedPreferences.getString(CACHED_PRODUCTS));
      },
    );
  });

  group('cacheProducts', () {
    test('should call SharedPreferences to cache the products', () async {
      // Arrange
      final tProductModels = [tProductModel];
      final expectedJsonString = json.encode(
        tProductModels.map((e) => e.toJson()).toList(),
      );

      // Act
      await localDataSource.cacheProducts(tProductModels);

      // Assert
      verify(
        mockSharedPreferences.setString(CACHED_PRODUCTS, expectedJsonString),
      );
    });
  });

  group('getProductById', () {
    test('should return product when ID exists in cached data', () async {
      // Arrange
      final cachedJsonString = json.encode(
        tProductModels.map((e) => e.toJson()).toList(),
      );

      when(
        mockSharedPreferences.getString(CACHED_PRODUCTS),
      ).thenReturn(cachedJsonString);

      // Act
      final result = await localDataSource.getProductById(tProductModel.id);

      // Assert
      expect(result, equals(tProductModel));
      verify(mockSharedPreferences.getString(CACHED_PRODUCTS));
    });

    test(
      'should throw CacheException when no product is found for ID',
      () async {
        // Arrange
        final cachedJsonString = json.encode(
          tProductModels.map((e) => e.toJson()).toList(),
        );

        when(
          mockSharedPreferences.getString(CACHED_PRODUCTS),
        ).thenReturn(cachedJsonString);

        // Act
        final call = localDataSource.getProductById('non_existing_id');

        // Assert
        await expectLater(() => call, throwsA(isA<CacheException>()));
        verify(mockSharedPreferences.getString(CACHED_PRODUCTS));
      },
    );

    test('should throw CacheException when no cache exists', () async {
      // Arrange
      when(mockSharedPreferences.getString(CACHED_PRODUCTS)).thenReturn(null);

      // Act
      final call = localDataSource.getProductById(tProductModel.id);

      // Assert
      await expectLater(() => call, throwsA(isA<CacheException>()));
      verify(mockSharedPreferences.getString(CACHED_PRODUCTS));
    });
  });
}
