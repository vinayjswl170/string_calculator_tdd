class StringCalculator
{
  int add(String numbers) {
    if (numbers.isEmpty) return 0; // KATA  Step 1.1

   // KATA Step 1.2 && 1.3 && 2 && 3
    final normalized = numbers.replaceAll('\n', ',');
    final parts= normalized.split(',');
    final result = parts.map((part) => int.parse(part)).reduce((a, b) => a + b);
    return result;

  }
}