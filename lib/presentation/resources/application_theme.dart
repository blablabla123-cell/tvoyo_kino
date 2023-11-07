import 'package:flutter/material.dart';
import 'package:tvoyo_kino/presentation/resources/application_colors.dart';

abstract class Themes {
  static final theme = ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor:
        ApplicationColors.scaffoldBackgroundColor, // 09090C
    navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: Colors.transparent,
        unselectedIconTheme: IconThemeData(
          color: ApplicationColors.navRailDestIconColor, // BABABA
          size: 56,
        ),
        selectedIconTheme: IconThemeData(
          color: ApplicationColors.navRailDestIconColor, // BABABA
          size: 56,
        )),
  );
}
