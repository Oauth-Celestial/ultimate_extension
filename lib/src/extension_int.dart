part of '../ultimate_extension.dart';

extension IntExt on int {
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
}

extension DoubleExtn on double {
  /// Rounds the double to [places] decimal places.

  /// Returns the double as a string with [places] decimal places.
  String toStringAsFixedPlaces(int places) {
    return toStringAsFixed(places);
  }
}

extension NumExt on num {
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

  num roundToDecimalPlaces(int places) {
    final mod = pow(10.0, places);
    return ((this * mod).round() / mod);
  }

  /// Converts the number from degrees to radians.
  num toRadians() {
    return this * (pi / 180.0);
  }

  /// Converts the number from radians to degrees.
  num toDegrees() {
    return this * (180.0 / pi);
  }

  /// Converts the number to an integer by rounding.
  int toInt() {
    return round();
  }

  /// Converts the number to a double.
  double toDouble() {
    return this.toDouble();
  }

  /// Returns the square of the number.
  num get square => this * this;

  /// Returns the cube of the number.
  num get cube => this * this * this;

  /// Returns the absolute value of the number.
  num get absolute => abs();

  /// Converts the number to a percentage string with [places] decimal places.
  String toPercentage(int places) {
    return "${(this * 100).toStringAsFixed(places)}%";
  }

  /// original :-  the original value you are comparing with
  /// limitTo:- limit  the decimal point till how much digits
  double percentageChangeFrom({required num original, int limitTo = 5}) {
    if (original == 0) {
      throw ArgumentError('The original value cannot be zero.');
    }
    return (((this - original) / original) * 100)
        .roundToDecimalPlaces(limitTo)
        .toDouble();
  }
}
