import 'dart:convert';

import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/features/products/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../fixture/fixture.dart';
import '../../../../mocks/mock_test.mocks.dart';

void main() {
  late ProductRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = ProductRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getAllProducts', () {
    final tProductModelList = [
      ProductModel.fromJson(json.decode(fixture('product.json'))),
      ProductModel.fromJson(json.decode(fixture('product_double.json'))),
    ];

    test(
      'should return a list of ProductModel when the response code is 200',
      () async {
        // Arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(json.encode(tProductModelList), 200),
        );

        // Act
        final result = await dataSource.getAllProducts();

        // Assert
        expect(result, equals(tProductModelList));
      },
    );

    test(
      'should throw a ServerException when the response code is not 200',
      () async {
        // Arrange
        when(
          mockHttpClient.get(any, headers: anyNamed('headers')),
        ).thenAnswer((_) async => http.Response('Not Found', 404));

        // Act
        final call = dataSource.getAllProducts;

        // Assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });

  group('create Product Testing', () {
    final tProductModel = ProductModel.fromJson(
      json.decode(fixture('product.json')),
    );

    test('should return void when the response code is 201', () async {
      // Arrange
      final tProductModel = ProductModel.fromJson(
        json.decode(fixture('product.json')),
      );
      when(
        mockHttpClient.post(
          any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response('', 201));

      // Act & Assert — just await the function; no need to assign
      await dataSource.createProduct(tProductModel);

      // If it doesn't throw, the test passes
      verify(
        mockHttpClient.post(
          Uri.parse('https://api.example.com/products'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(tProductModel.toJson()),
        ),
      ).called(1);
    });

    test('should throw ServerException when the response is not 201', () async {
      // Arrange
      when(
        mockHttpClient.post(
          any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response('Error', 500));

      // Act & Assert
      expect(
        () => dataSource.createProduct(tProductModel),
        throwsA(isA<ServerException>()),
      );
    });
  });

  group('getProductById', () {
    final tProductId = '123';
    final tProductModel = ProductModel.fromJson(
      json.decode(fixture('product.json')),
    );

    test('should return ProductModel when the response code is 200', () async {
      // Arrange
      when(
        mockHttpClient.get(
          Uri.parse('https://api.example.com/products/$tProductId'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(json.encode(tProductModel.toJson()), 200),
      );

      // Act
      final result = await dataSource.getProductById(tProductId);

      // Assert
      expect(result, equals(tProductModel));
    });

    test('should throw NotFoundException when response code is 404', () async {
      // Arrange
      when(
        mockHttpClient.get(
          Uri.parse('https://api.example.com/products/$tProductId'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      // Act & Assert
      expect(
        () => dataSource.getProductById(tProductId),
        throwsA(isA<NotFoundException>()),
      );
    });

    test('should throw ServerException for other status codes', () async {
      // Arrange
      when(
        mockHttpClient.get(
          Uri.parse('https://api.example.com/products/$tProductId'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response('Internal Server Error', 500));

      // Act & Assert
      expect(
        () => dataSource.getProductById(tProductId),
        throwsA(isA<ServerException>()),
      );
    });
  });
  group('updateProduct', () {
    final tProductModel = ProductModel.fromJson(
      json.decode(fixture('product.json')),
    );

    test(
      'should complete without throwing when response code is 200',
      () async {
        // Arrange
        when(
          mockHttpClient.put(
            Uri.parse('https://api.example.com/products/${tProductModel.id}'),
            headers: anyNamed('headers'),
            body: json.encode(tProductModel.toJson()),
          ),
        ).thenAnswer((_) async => http.Response('', 200));

        // Act
        await dataSource.updateProduct(tProductModel);

        // Assert
        verify(
          mockHttpClient.put(
            Uri.parse('https://api.example.com/products/${tProductModel.id}'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(tProductModel.toJson()),
          ),
        );
      },
    );

    test(
      'should throw ServerException when response code is not 200',
      () async {
        // Arrange
        when(
          mockHttpClient.put(
            Uri.parse('https://api.example.com/products/${tProductModel.id}'),
            headers: anyNamed('headers'),
            body: json.encode(tProductModel.toJson()),
          ),
        ).thenAnswer((_) async => http.Response('Error', 500));

        // Act & Assert
        expect(
          () => dataSource.updateProduct(tProductModel),
          throwsA(isA<ServerException>()),
        );
      },
    );
  });

  group('deleteProduct', () {
    final tProductId = '123';

    test(
      'should complete without throwing when response code is 204',
      () async {
        // Arrange
        when(
          mockHttpClient.delete(
            Uri.parse('https://api.example.com/products/$tProductId'),
            headers: anyNamed('headers'),
          ),
        ).thenAnswer((_) async => http.Response('', 204));

        // Act
        await dataSource.deleteProduct(tProductId);

        // Assert
        verify(
          mockHttpClient.delete(
            Uri.parse('https://api.example.com/products/$tProductId'),
            headers: {'Content-Type': 'application/json'},
          ),
        );
      },
    );

    test(
      'should throw ServerException when response code is not 204',
      () async {
        // Arrange
        when(
          mockHttpClient.delete(
            Uri.parse('https://api.example.com/products/$tProductId'),
            headers: anyNamed('headers'),
          ),
        ).thenAnswer((_) async => http.Response('Error', 500));

        // Act & Assert
        expect(
          () => dataSource.deleteProduct(tProductId),
          throwsA(isA<ServerException>()),
        );
      },
    );
  });
}
