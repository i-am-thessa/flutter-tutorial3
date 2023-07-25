import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    colorScheme: const ColorScheme.light().copyWith(primary: Colors.blue[900]),
  );
  static final dark = ThemeData(
    colorScheme: const ColorScheme.dark().copyWith(primary: Colors.grey),
  );
}
