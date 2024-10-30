import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.green,
  fontFamily: Fonts.regular,
  colorScheme: ColorScheme.fromSwatch(accentColor: AppColors.main),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
);

const cupertinoTheme = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      fontFamily: Fonts.regular,
      color: AppColors.black,
    ),
    dateTimePickerTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 24,
      fontFamily: Fonts.medium,
    ),
  ),
);
