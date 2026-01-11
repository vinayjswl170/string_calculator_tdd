class StringCalculator
{
  int add(String numbers) {
    if (numbers.isEmpty) return 0; // KATA  Step 1.1

   // KATA Step 1.3
    final parts= numbers.split(',');
    final result = parts.map((part) => int.parse(part)).reduce((a, b) => a + b);
    return result;

  }
}