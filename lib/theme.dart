import 'dart:ui';

import 'package:flutter/cupertino.dart';

class MyColors {
  const MyColors();

  static const Color loginGradientEnd = const Color(0xFFf7418c);
  static const Color loginGradientStart = const Color(0xFFfbab66);
  static const Color themeColor = const Color.fromARGB(255, 157, 34, 94);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
