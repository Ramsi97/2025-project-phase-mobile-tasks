import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/features/products/data/datasources/product_local_data_source.dart';
import 'package:ecommerce_app/features/products/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/features/products/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/features/products/domain/usecases/view_all_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';

import '../../domain/usecases/create_product_test.mocks.dart';
import 'product_repository_test.mocks.dart';

void main() {
  late MockProductLocalDataSource mockLocalDataSource;
  late MockProductRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late ProductRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockProductRemoteDataSource();
    mockLocalDataSource = MockProductLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  List<ProductModel> tProducts = [
    const ProductModel(
      id: '1',
      name: 'Test Product',
      description: 'This is a test product',
      price: 99.99,
      imageUrl: 'http://example.com/image.jpg',
    ),
  ];

  group('Create Product Testing', () {
    final tproduct = const ProductModel(
      id: '1',
      name: 'Test Product',
      description: 'This is a test product',
      price: 99.99,
      imageUrl: 'http://example.com/image.jpg',
    );

    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // act
      final result = await repository.createProduct(tproduct);

      // assert
      expect(result.isRight(), true);
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
        'should return remote data when the call to remote data source is sucess',
        () async {
          when(
            mockRemoteDataSource.createProduct(tproduct),
          ).thenAnswer((_) async => const Right(null));

          final result = await repository.createProduct(tproduct);

          expect(result, const Right(null));
          verify(mockRemoteDataSource.createProduct(tproduct));
        },
      );

      test(
        'should return server Failure when the call to remote data source is unsucessful',
        () async {
          when(
            mockRemoteDataSource.createProduct(tproduct),
          ).thenThrow(ServerException());

          final result = await repository.createProduct(tproduct);

          expect(result, Left(ServerFailure()));
          verify(mockRemoteDataSource.createProduct(tproduct));
          verifyNoMoreInteractions(mockRemoteDataSource);
        },
      );
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
        'should return last localy cached data when there is cached data is present',
        () async {
          when(
            mockLocalDataSource.getCachedProducts(),
          ).thenAnswer((_) async => tProducts);

          final result = await repository.getAllProducts();

          expect(
            result,
            equals(Right(tProducts.map((e) => e.toEntity()).toList())),
          );
          verify(mockLocalDataSource.getCachedProducts());
          verifyNoMoreInteractions(mockLocalDataSource);
        },
      );
    });

    // Add more tests for other methods like getAllProducts, getProductById, etc.
  });
}
