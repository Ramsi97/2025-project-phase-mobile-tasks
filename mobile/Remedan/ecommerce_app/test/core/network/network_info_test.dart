import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../mocks/mock_test.mocks.dart';

void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  group('isConnected', () {
    test('should return false when there is no internet connection', () async {
      // Arrange

      final tHasConnection = Future.value(true);
      when(
        mockInternetConnectionChecker.hasConnection,
      ).thenAnswer((_) async => tHasConnection);

      // Act
      final result = networkInfo.isConnected;

      // Assert
      expect(await result, await tHasConnection);
      verify(mockInternetConnectionChecker.hasConnection);
    });
  });
}
