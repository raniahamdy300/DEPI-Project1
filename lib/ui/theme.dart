import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

const Color purpleclr = Color(0xFFC962DB);
const Color yellowclr = Color(0xFFFFB746);
const pinkclr = Color(0xFFff4667);
const whiteclr = Colors.white;
const primaryclr = purpleclr;
const Color darkgreyclr = Color(0xFF121212);
Color darkheaderclr = Color(0xFF424242);

class Themes {
  static final light =
      ThemeData(primaryColor: primaryclr, brightness: Brightness.light);
  static final dark = ThemeData(
    primaryColor: darkgreyclr,
    brightness: Brightness.dark,
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.grey[500] : Colors.grey,
  ));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.grey[500] : Colors.grey,
  ));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}

TextStyle get hintStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 12,
    color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
  ));
}
