import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/calculator.dart';

void main() {
  late StringCalculator calculator;
  // Initialize calculator before each test
  setUp(() {
    calculator = StringCalculator();
  });
  // STEP 1
  //1.1
  test('empty string returns 0', () {
    expect(calculator.add(''), 0);
  });

  // 1.2
  test('single number returns itself', () {
    expect(calculator.add('1'), 1);
  });

  // 1.3
  test('two numbers return their sum', () {
    expect(calculator.add('1,5'), 6);
  });

  //Step 2
  test('multiple numbers return their sum', () {
    expect(calculator.add('1,2,3,4'), 10);
  });

  //Step 3
  test('numbers with new lines are supported', () {
    expect(calculator.add('1\n2,3'), 6);
  });

  //Step 4
  test('supports custom delimiter', () {
    expect(calculator.add('//;\n1;2'), 3);
  });

  //Step 5
  test('negative numbers throw exception', () {
    expect(
          () => calculator.add('1,-2,3'),
      throwsA(
        predicate((e) =>
        e is Exception &&
            e.toString().contains('negative numbers not allowed -2')),
      ),
    );
  });

  // Step 5.1
  test('multiple negative numbers are listed in exception', () {
    expect(
          () => calculator.add('1,-2,-3'),
      throwsA(
        predicate(
              (e) => e.toString().contains('-2,-3'),
        ),
      ),
    );
  });

  // Step 6
  test('numbers greater than 1000 are ignored ', () {
    expect(calculator.add('2,1001'), 2);
  });

}