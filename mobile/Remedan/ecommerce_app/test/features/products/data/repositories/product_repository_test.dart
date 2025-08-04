import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/features/products/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

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

  final tProductModel = const ProductModel(
    id: '1',
    name: 'Test Product',
    description: 'This is a test product',
    price: 99.99,
    imageUrl: 'http://example.com/image.jpg',
  );

  final Product tProduct = tProductModel.toEntity();

  final tProductModelList = [tProductModel];
  final List<Product> tProductList = tProductModelList
      .map((e) => e.toEntity())
      .toList();

  group('createProduct', () {
    test(
      'should return Right(null) when product is created successfully',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          mockRemoteDataSource.createProduct(tProductModel),
        ).thenAnswer((_) async => Future.value());

        // Act
        final result = await repository.createProduct(tProduct);

        // Assert
        expect(result, const Right(null));
        verify(mockRemoteDataSource.createProduct(tProductModel));
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return Left(ServerFailure) when server exception occurs',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          mockRemoteDataSource.createProduct(tProductModel),
        ).thenThrow(ServerException());

        // Act
        final result = await repository.createProduct(tProduct);

        // Assert
        expect(result, Left(ServerFailure()));
      },
    );

    test(
      'should return Left(NetworkFailure) when there is no network connection',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        // Act
        final result = await repository.createProduct(tProduct);

        // Assert
        expect(result, Left(NetworkFailure()));
      },
    );
  });

  group('Getting all product testing', () {
    test(
      'should return Right(List<Product>) when products are fetched successfully',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          mockRemoteDataSource.getAllProducts(),
        ).thenAnswer((_) async => tProductModelList);

        // Act
        final result = await repository.getAllProducts();

        // Assert
        expect(result, Right(tProductList));
        verify(mockRemoteDataSource.getAllProducts());
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return Left(ServerFailure) when server exception occurs',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          mockRemoteDataSource.getAllProducts(),
        ).thenThrow(ServerException());

        // Act
        final result = await repository.getAllProducts();

        // Assert
        expect(result, Left(ServerFailure()));
      },
    );

    test(
      'should return Left(CacheFailure) when cache exception occurs',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(
          mockLocalDataSource.getCachedProducts(),
        ).thenThrow(CacheException());

        // Act
        final result = await repository.getAllProducts();

        // Assert
        expect(result, Left(CacheFailure()));
      },
    );
  });

  group('get product by id testing', () {
    test(
      'should return Right(Product) when product is fetched successfully',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          mockRemoteDataSource.getProductById(tProduct.id),
        ).thenAnswer((_) async => tProductModel);

        // Act
        final result = await repository.getProductById(tProduct.id);

        // Assert
        expect(result, Right(tProduct));
        verify(mockRemoteDataSource.getProductById(tProduct.id));
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return Left(ServerFailure) when server exception occurs',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          mockRemoteDataSource.getProductById(tProduct.id),
        ).thenThrow(ServerException());

        // Act
        final result = await repository.getProductById(tProduct.id);

        // Assert
        expect(result, Left(ServerFailure()));
      },
    );

    test(
      'should return Left(CacheFailure) when cache exception occurs',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(
          mockLocalDataSource.getProductById(tProduct.id),
        ).thenThrow(CacheException());

        // Act
        final result = await repository.getProductById(tProduct.id);

        // Assert
        expect(result, Left(CacheFailure()));
      },
    );
  });

  group('update product testing', () {
    test(
      'should return Right(Product) when product is updated successfully',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          mockRemoteDataSource.updateProduct(tProductModel),
        ).thenAnswer((_) async => Future.value());

        // Act
        final result = await repository.updateProduct(tProduct);

        // Assert
        expect(result, const Right(null));
        verify(mockRemoteDataSource.updateProduct(tProductModel));
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return Left(ServerFailure) when server exception occurs',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          mockRemoteDataSource.updateProduct(tProductModel),
        ).thenThrow(ServerException());

        // Act
        final result = await repository.updateProduct(tProduct);

        // Assert
        expect(result, Left(ServerFailure()));
      },
    );

    test(
      'should return Left(NetworkFailure) when there is no network connection',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        // Act
        final result = await repository.updateProduct(tProduct);

        // Assert
        expect(result, Left(NetworkFailure()));
      },
    );
  });

  group('delete product testing', () {
    test(
      'should return Right(null) when product is deleted successfully',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          mockRemoteDataSource.deleteProduct(tProduct.id),
        ).thenAnswer((_) async => Future.value());

        // Act
        final result = await repository.deleteProduct(tProduct.id);

        // Assert
        expect(result, const Right(null));
        verify(mockRemoteDataSource.deleteProduct(tProduct.id));
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return Left(ServerFailure) when server exception occurs',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          mockRemoteDataSource.deleteProduct(tProduct.id),
        ).thenThrow(ServerException());

        // Act
        final result = await repository.deleteProduct(tProduct.id);

        // Assert
        expect(result, Left(ServerFailure()));
      },
    );

    test(
      'should return Left(NetworkFailure) when there is no network connection',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        // Act
        final result = await repository.deleteProduct(tProduct.id);

        // Assert
        expect(result, Left(NetworkFailure()));
      },
    );
  });
}
