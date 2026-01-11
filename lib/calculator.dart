class StringCalculator
{
  int add(String numbers) {
    if (numbers.isEmpty) return 0; // KATA  Step 1.1

   // KATA Step 1.2 && 1.3 && 2 && 3 && 4 && 5 && 6
    List<String> delimiters = [',','\n'];
    String values = numbers;

    // Handle custom delimiters
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      final header = parts[0]; // //[*][%]
      values = parts[1];

      final regex = RegExp(r'\[(.*?)\]');
      final matches = regex.allMatches(header);

      if (matches.isNotEmpty) {
        delimiters = matches.map((m) => m.group(1)!).toList();
      } else {
        delimiters = [header[2]];
      }
    }

    // Normalize all delimiters to comma
    for (final delimiter in delimiters) {
      values = values.replaceAll(delimiter, ',');
    }

    final numbersList = values.split(',').map(int.parse).toList();

    // Negative numbers check
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