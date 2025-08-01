import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/domain/usecases/view_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late ViewProduct usecase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    usecase = ViewProduct(mockRepo);
  });

  final tProduct = const Product(
    id: '1',
    name: 'Shoes',
    description: 'Nice running shoes',
    price: 99.99,
    imageUrl: 'shoes.png',
  );

  test('should return product by ID from repository', () async {
    when(
      mockRepo.getProductById('1'),
    ).thenAnswer((_) async => Right<Failure, Product?>(tProduct));

    final result = await usecase('1');

    expect(result, Right<Failure, Product?>(tProduct));
    verify(mockRepo.getProductById('1'));
    verifyNoMoreInteractions(mockRepo);
  });
}
