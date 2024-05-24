import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upray_mobile/core/presentation/style/app_colors.dart';

ThemeData get defaultAppTheme => ThemeData(
      primaryTextTheme: GoogleFonts.pacificoTextTheme(
        const TextTheme(
          displayLarge: TextStyle(
            fontSize: 80,
            color: AppColors.yellowGold,
          ),
        ),
      ),
      textTheme: GoogleFonts.acmeTextTheme(
        const TextTheme(
          labelLarge: TextStyle(fontSize: 22.0),
          displayLarge: TextStyle(
            fontSize: 80,
            color: AppColors.yellowGold,
          ),
          bodyLarge: TextStyle(color: AppColors.textDarkBlue),
        ),
      ),
      scaffoldBackgroundColor: AppColors.darkBLue,
      colorScheme: const ColorScheme.light(
        primary: AppColors.darkBLue,
        secondary: AppColors.yellowGold,
        primaryContainer: AppColors.darkBLue,
        brightness: Brightness.dark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          ),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(56.0)),
          backgroundColor: AppColors.yellowGold.materialStateProperty,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        constraints: BoxConstraints.tight(
          const Size.fromHeight(70),
        ),
        hintStyle: const TextStyle(color: AppColors.hintColor),
        errorStyle: const TextStyle(height: 0.5),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: _inputBorder(AppColors.lightGray),
        disabledBorder: _inputBorder(AppColors.lightGray),
        focusedErrorBorder: _inputBorder(Colors.red, width: 2.0),
        enabledBorder: _inputBorder(AppColors.yellowGold),
        errorBorder: _inputBorder(Colors.red),
        focusedBorder: _inputBorder(AppColors.yellowGold, width: 2.0),
        fillColor: AppColors.lightGray,
        filled: true,
        contentPadding: const EdgeInsets.only(
          top: 16.0,
          bottom: 16.0,
          left: 12.0,
          right: 2.0,
        ),
        errorMaxLines: 2,
      ),
    );

OutlineInputBorder _inputBorder(final Color color, {final double? width}) =>
    OutlineInputBorder(
      borderSide: BorderSide(color: color, width: width ?? 1.0),
      borderRadius: BorderRadius.circular(12.0),
    );