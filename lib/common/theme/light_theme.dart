import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gosapp/common/utils/coloors.dart';

import '../extension/custom_theme_extension.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      backgroundColor: Coloors.backgroundLight,
      scaffoldBackgroundColor: Coloors.backgroundLight,
      extensions: [
        CustomThemeExtension.lightMode,
      ],
      appBarTheme: AppBarTheme(
          backgroundColor: Coloors.greenLight,
          titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark),
          iconTheme: IconThemeData(color: Colors.white)),
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        unselectedLabelColor: Color(0xFFB3D9D2),
        labelColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: Coloors.greenLight,
        foregroundColor: Coloors.backgroundLight,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      )),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Coloors.backgroundLight,
          modalBackgroundColor: Coloors.backgroundLight,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ))),
      dialogBackgroundColor: Coloors.backgroundLight,
      dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Coloors.greenDark, foregroundColor: Colors.white));
}
