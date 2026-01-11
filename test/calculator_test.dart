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

}