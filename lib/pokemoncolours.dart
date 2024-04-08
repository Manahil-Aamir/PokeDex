import 'package:flutter/material.dart';

class PokemonColours {
  static Map<String, Color> colourMap = {
    'Grass': Colors.greenAccent,
    'Fire': Colors.red[400]!,
    'Water': Colors.blue[400]!,
    'Bug': const Color.fromARGB(255, 153, 235, 59),
    'Normal': Colors.grey[400]!,
    'Poison': const Color(0xFF7C4DFF),
    'Electric': const Color.fromARGB(255, 239, 193, 27),
    'Ground': Colors.brown,
    'Flying': Colors.blueGrey[800]!,
    'Fighting': Colors.red[900]!,
    'Psychic': Colors.purple[400]!,
    'Rock': const Color.fromARGB(140, 228, 215, 210),
    'Steel': Colors.blueGrey[400]!,
    'Ghost': Colors.black26,
    'Ice': Colors.blue[50]!,
    'Dragon': Colors.green[900]!,
    'Dark': Colors.grey[800]!,
  };

  static Color getColorForType(String type) {
    return colourMap[type] ?? Colors.white; // Return grey if type not found
  }
}