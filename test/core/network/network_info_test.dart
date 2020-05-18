import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:tddpractice/core/network/network_info.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl networkInfo;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test('should forward the call to DataConnectionChecker.hasConnection', () async {
      // arrange
      final tHasConnetionFuture = Future.value(true);

      when(mockDataConnectionChecker.hasConnection).thenAnswer((_) async => true);

      // act
      final result = networkInfo.isConnected;

      // assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnetionFuture);
    });
  });
}
