import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:tddpractice/core/util/input_converter.dart';

void main() {
  InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('string to unsigned int', () {
    test('should return an int when the string represents an unsigned int', () {
      // arrange
      final str = '123';

      // act
      final result = inputConverter.stringToUnsignedInteger(str);

      // assert
      expect(result, Right(123));
    });

    test('should return a failure when the string is not an int', () {
      final str = 'abc';

      // act
      final result = inputConverter.stringToUnsignedInteger(str);

      // assert
      expect(result, Left(InvalidInputFailure()));
    });

    test('should return a failure when the string is a negative int', () {
      final str = '-123';

      // act
      final result = inputConverter.stringToUnsignedInteger(str);

      // assert
      expect(result, Left(InvalidInputFailure()));
    });
  });
}