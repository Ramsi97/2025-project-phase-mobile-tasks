import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecases/usecase.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/usecases/view_all_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../mocks/mock_test.mocks.dart';

// The main function is needed for the build_runner to work correctly
void main() {
  // Your tests go here
  late MockProductRepository mockRepo;
  late ViewAllProduct usecase;

  setUp(() {
    mockRepo = MockProductRepository();
    usecase = ViewAllProduct(mockRepo);
  });
  final tProducts = [
    const Product(
      id: '1',
      name: 'Shoes',
      description: 'Running shoes',
      price: 89.99,
      imageUrl: 'shoes.png',
    ),
    const Product(
      id: '2',
      name: 'T-shirt',
      description: 'Cotton T-shirt',
      price: 19.99,
      imageUrl: 'tshirt.png',
    ),
  ];

  test('should call getAllProducts on repository', () async {
    // Arrange
    when(mockRepo.getAllProducts()).thenAnswer((_) async => Right(tProducts));

    // Act
    final result = await usecase(NoParams());

    // Assert
    expect(result, Right(tProducts));
    verify(mockRepo.getAllProducts());
    verifyNoMoreInteractions(mockRepo);
  });
}
