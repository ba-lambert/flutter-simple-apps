import 'package:flutter/material.dart';

import 'MyAppColors.dart';

class MyAppThemes {
  static final lightTheme = ThemeData(
    primaryColor: MyAppColors.lightBlue,
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    primaryColor: MyAppColors.darkBlue,
    brightness: Brightness.dark,
  );
}
