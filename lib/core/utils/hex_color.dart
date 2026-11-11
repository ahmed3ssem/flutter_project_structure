import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    String cleanHex = hexColor.toUpperCase().replaceAll("#", "").trim();

    if (cleanHex.length == 3) {
      // e.g. "FFF" -> "FFFFFF"
      cleanHex = cleanHex.split('').map((char) => '$char$char').join();
    }

    if (cleanHex.length == 6) {
      cleanHex = "FF$cleanHex";
    } else if (cleanHex.length != 8) {
      // Fallback for invalid hex length
      return 0xFF000000;
    }

    return int.tryParse(cleanHex, radix: 16) ?? 0xFF000000;
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
