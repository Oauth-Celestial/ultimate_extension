part of '../ultimate_extension.dart';

extension IntExt on num {
  String get toRoman {
    assert(this is double, "Double cannot be converted to romanNumber");

    if (this < 1 || this > 3999) {
      throw Exception('Number out of range (1 to 3999)');
    }

    const romanTable = {
      1000: 'M',
      900: 'CM',
      500: 'D',
      400: 'CD',
      100: 'C',
      90: 'XC',
      50: 'L',
      40: 'XL',
      10: 'X',
      9: 'IX',
      5: 'V',
      4: 'IV',
      1: 'I',
    };

    final result = StringBuffer();
    var number = this;
    for (final entry in romanTable.entries) {
      final value = entry.key;
      final numeral = entry.value;
      while (number >= value) {
        result.write(numeral);
        number -= value;
      }
    }
    return result.toString();
  }

/* Text(
              'Int Amount: ${amountInt.toCurrency(includeSymbol: true, symbol: '\$')}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Double Amount: ${amountDouble.toCurrency(includeSymbol: true, symbol: '\$')}',
              style: const TextStyle(fontSize: 24),
            ),  */
  String toCurrency(
      {String separator = ',',
      String symbol = '',
      bool includeSymbol = false}) {
    String number = toString();
    return number.formatCurrency(separator, symbol, includeSymbol);
  }
}
