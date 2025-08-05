import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/usecases/update_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../mocks/mock_test.mocks.dart';

// This line is crucial — use the exact test file name before `.mocks.dart`

// The main function is needed for the build_runner to work correctly
void main() {
  // Your tests go here
  late MockProductRepository mockRepo;
  late UpdateProduct usecase;

  setUp(() {
    mockRepo = MockProductRepository();
    usecase = UpdateProduct(mockRepo);
  });

  final tProduct = const Product(
    id: '1',
    name: 'before Updated Shoes',
    description: 'beforeupdated description',
    price: 99.99,
    imageUrl: 'updated.png',
  );
  final updatedProduct = const Product(
    id: '1',
    name: 'Updated Shoes',
    description: 'Updated description',
    price: 199.99,
    imageUrl: 'updated.png',
  );

  test('should update a product in the repository', () async {
    // Arrange
    when(
      mockRepo.updateProduct(tProduct),
    ).thenAnswer((_) async => Right(updatedProduct));

    // Act
    final result = await usecase(tProduct);

    // Assert
    expect(result, Right(updatedProduct));
    verify(mockRepo.updateProduct(tProduct));
    verifyNoMoreInteractions(mockRepo);
  });
}
