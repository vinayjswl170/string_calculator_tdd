class StringCalculator
{
  int add(String numbers) {
    if (numbers.isEmpty) return 0; // KATA  Step 1.1

   // KATA Step 1.2 && 1.3 && 2 && 3 && 4 && 5 && 6
    String delimiter = ',';
    String values = numbers;

    // Handle custom delimiter
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      final header = parts[0]; // //[***]
      values = parts[1];

      // NEW LOGIC: delimiter of any length
      if (header.contains('[')) {
        delimiter = header.substring(
          header.indexOf('[') + 1,
          header.indexOf(']'),
        );
      } else {
        delimiter = header[2]; // single char delimiter
      }
    }

    // Newline support
    values = values.replaceAll('\n', delimiter);
    final numbersList = values.split(delimiter).map(int.parse).toList();

    final negatives = numbersList.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception(
        'negative numbers not allowed ${negatives.join(',')}',
      );
    }
  // Ignore >1000
    final result = numbersList.where((n) => n <= 1000).fold(0, (sum, n) => sum + n);

    return result;
  }
}