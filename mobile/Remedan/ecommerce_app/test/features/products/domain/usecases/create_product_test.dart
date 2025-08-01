import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/domain/usecases/create_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late CreateProduct usecase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    usecase = CreateProduct(mockRepo);
  });

  final tProduct = const Product(
    id: '1',
    name: 'Shoes',
    description: 'Running shoes',
    price: 89.99,
    imageUrl: 'shoes.png',
  );

  test('should call createProduct on repository', () async {
    when(
      mockRepo.createProduct(tProduct),
    ).thenAnswer((_) async => Future.value(const Right(unit)));

    await usecase(tProduct);

    verify(mockRepo.createProduct(tProduct));
    verifyNoMoreInteractions(mockRepo);
  });
}
