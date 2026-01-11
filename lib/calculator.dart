class StringCalculator
{
  int add(String numbers) {
    if (numbers.isEmpty) return 0; // KATA  Step 1.1

   // KATA Step 1.2 && 1.3 && 2 && 3
    String delimiter = ',';
    String values = numbers;

    if (numbers.startsWith('//')) {
      delimiter = numbers[2];
      values = numbers.substring(4);
    }

    values = values.replaceAll('\n', delimiter);
    final parts= values.split(delimiter);
    final result = parts.map((part) => int.parse(part)).reduce((a, b) => a + b);
    return result;

  }
}