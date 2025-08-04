import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  // Implement all abstract methods from ProductRepository

  @override
  Future<Either<Failure, void>> createProduct(Product product) async {
    if (await networkInfo.isConnected) {
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );

      try {
        await remoteDataSource.createProduct(productModel);
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteProduct(id);
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getAllProducts();
        localDataSource.cacheProducts(remoteProducts);
        return Right(remoteProducts.map((model) => model.toEntity()).toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProducts = await localDataSource.getCachedProducts();
        return Right(localProducts.map((model) => model.toEntity()).toList());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final productModel = await remoteDataSource.getProductById(id);
        if (productModel != null) {
          return Right(productModel.toEntity());
        } else {
          return Left(NotFoundFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final productModel = await localDataSource.getProductById(id);
        return Right(productModel!.toEntity());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(Product product) async {
    if (await networkInfo.isConnected) {
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );

      try {
        await remoteDataSource.updateProduct(productModel);
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
