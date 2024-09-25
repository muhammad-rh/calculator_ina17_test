import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: false,
    primarySwatch: Colors.red,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
