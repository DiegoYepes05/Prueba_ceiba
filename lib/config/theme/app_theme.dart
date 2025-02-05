import 'package:flutter/material.dart';

final Color colorPrimary = Colors.green.shade900;

class AppTheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorPrimary,
      appBarTheme: AppBarTheme(
          backgroundColor: colorPrimary,
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500)),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      ));
}
