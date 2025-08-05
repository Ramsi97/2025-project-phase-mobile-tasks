import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/usecases/create_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../mocks/mock_test.mocks.dart';

void main() {
  late MockProductRepository mockRepo;
  late CreateProduct usecase;

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
    ).thenAnswer((_) async => const Right<Failure, void>(null));

    final result = await usecase(tProduct);

    expect(result, const Right<Failure, void>(null));

    verify(mockRepo.createProduct(tProduct));
    verifyNoMoreInteractions(mockRepo);
  });
}
