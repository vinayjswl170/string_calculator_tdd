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
    final numbersList = values.split(delimiter).map(int.parse).toList();

    final negatives = numbersList.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception(
        'negative numbers not allowed ${negatives.join(',')}',
      );
    }

    final result = numbersList.reduce((a, b) => a + b);
    return result;

  }
}