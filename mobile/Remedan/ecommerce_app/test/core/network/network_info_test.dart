import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';

class MockConnectionChecker extends Mock implements InternetConnectionChecker {}

void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockConnectionChecker mockChecker;

  setUp(() {
    mockChecker = MockConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockChecker);
  });

  test(
    'should forward the call to InternetConnectionChecker.hasConnection',
    () async {
      when(mockChecker.hasConnection).thenAnswer((_) async => true);

      final result = await networkInfoImpl.isConnected;

      verify(mockChecker.hasConnection);
      expect(result, true);
    },
  );
}
