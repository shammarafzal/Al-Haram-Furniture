import 'package:flutter/material.dart';

const PrimaryColor = const Color(0xFFb71c1c);
const PrimaryColorLight = const Color(0xFFf05545);
const PrimaryColorDark = const Color(0xFF7f0000);

const SecondaryColor = const Color(0xFFb2dfdb);
const SecondaryColorLight = const Color(0xFFe5ffff);
const SecondaryColorDark = const Color(0xFF82ada9);

const Background = const Color(0xFFfffdf7);
const TextColor = const Color(0xFFffffff);

class MyTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      accentColor: SecondaryColor,
      accentColorBrightness: Brightness.dark,

      primaryColor: PrimaryColor,
      primaryColorDark: PrimaryColorDark,
      primaryColorLight: PrimaryColorLight,
      primaryColorBrightness: Brightness.dark,

      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: SecondaryColor,
        textTheme: ButtonTextTheme.primary,
      ),

      scaffoldBackgroundColor: Background,
      cardColor: Background,
      textSelectionColor: PrimaryColorLight,
      backgroundColor: Background,

      textTheme: base.textTheme.copyWith(
          subtitle1: base.textTheme.subtitle1!.copyWith(color: TextColor),
          bodyText1: base.textTheme.bodyText1!.copyWith(color: TextColor),
          bodyText2: base.textTheme.bodyText2!.copyWith(color: TextColor)
      ),
    );
  }
}