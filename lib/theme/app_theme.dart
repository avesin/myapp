import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.deepGreen,
  primaryColor: AppColors.mintAccent,
  fontFamily: 'YourFontFamily',

  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: AppColors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.darkTeal,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: const TextStyle(color: Colors.white70),
  ),

  iconTheme: const IconThemeData(color: AppColors.white),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.white,
      textStyle: const TextStyle(decoration: TextDecoration.underline),
    ),
  ),
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.lightBackground,
  primaryColor: AppColors.skyBlue,
  fontFamily: 'YourFontFamily',

  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.lightText,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: AppColors.lightText,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.lightText,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.skyBlue),
    ),
    hintStyle: const TextStyle(color: Colors.black45),
  ),

  iconTheme: const IconThemeData(color: AppColors.skyBlue),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.skyBlue,
      textStyle: const TextStyle(decoration: TextDecoration.underline),
    ),
  ),
);
