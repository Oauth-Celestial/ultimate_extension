part of '../ultimate_extension.dart';

extension ColorHelper on Color {
  ///To create a Color object from a hexadecimal string:
  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// To generate a random Color:
  Color getRandomColor() {
    final Random random = Random();
    final int r = random.nextInt(256);
    final int g = random.nextInt(256);
    final int b = random.nextInt(256);
    return Color.fromARGB(255, r, g, b);
  }

  /// Generates a random shade of the current color.
  Color getRandomShade() {
    final random = Random();

    // Generate a random factor between 0.5 and 1.5 for lightening/darkening
    double factor = 0.5 + random.nextDouble();

    // Adjust the RGB values by the factor
    int red = (r * factor).clamp(0, 255).toInt();
    int green = (g * factor).clamp(0, 255).toInt();
    int blue = (b * factor).clamp(0, 255).toInt();

    return Color.fromARGB(a.toInt(), red, green, blue);
  }
}
