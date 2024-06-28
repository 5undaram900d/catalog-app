
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class A04_MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.blue,
    cardColor: Colors.white,
    canvasColor: creamColor,
    // buttonColor: darkBluish,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkBluish,
    ),
    // accentColor: darkBluish,
    colorScheme: ColorScheme.light(onSecondary: darkBluish),
    // fontFamily: GoogleFonts.nabla().fontFamily,
    textTheme: Theme.of(context).textTheme,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      // for removing border from appbar
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black),
      centerTitle: true,
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    cardColor: Colors.black,        /// for all card in dark_mode
    canvasColor: darkCreamColor,
    // buttonColor: lightBluish,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightBluish,
    ),
    // accentColor: Colors.white,
    colorScheme: ColorScheme.dark(onSecondary: Colors.white),
    textTheme: Theme.of(context).textTheme,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      // for removing border from appbar
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      // textTheme: Theme.of(context).textTheme,
      titleTextStyle: TextStyle(color: Colors.white),
      centerTitle: true,
    ),
  );


  /// colors
  static Color creamColor = Color(0xFFE7E8E8);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluish = Color(0xFF403b58);
  static Color lightBluish = Vx.indigo500;

}



// 3:17