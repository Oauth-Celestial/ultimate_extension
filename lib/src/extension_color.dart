part of '../ultimate_extension.dart';

extension ColorHelper on Color {
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
