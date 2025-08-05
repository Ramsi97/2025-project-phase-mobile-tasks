import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/usecases/view_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../mocks/mock_test.mocks.dart';

// The main function is needed for the build_runner to work correctly
void main() {
  late MockProductRepository mockRepo;
  late ViewProduct usecase;

  setUp(() {
    mockRepo = MockProductRepository();
    usecase = ViewProduct(mockRepo);
  });

  final tProduct = const Product(
    id: '1',
    name: 'Shoes',
    description: 'Running shoes',
    price: 89.99,
    imageUrl: 'shoes.png',
  );

  test('should call getProductById on repository', () async {
    // Arrange
    when(
      mockRepo.getProductById(tProduct.id),
    ).thenAnswer((_) async => Right(tProduct));

    // Act
    final result = await usecase(tProduct.id);

    // Assert
    expect(result, Right(tProduct));
    verify(mockRepo.getProductById(tProduct.id));
    verifyNoMoreInteractions(mockRepo);
  });
}
