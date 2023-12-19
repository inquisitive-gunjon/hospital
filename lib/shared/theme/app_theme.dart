import 'package:hospital_riverpod/shared/data/local/storage_service.dart';
import 'package:hospital_riverpod/shared/domain/providers/sharedpreferences_storage_service_provider.dart';
import 'package:hospital_riverpod/shared/globals.dart';
import 'package:hospital_riverpod/shared/theme/app_colors.dart';
import 'package:hospital_riverpod/shared/theme/test_styles.dart';
import 'package:hospital_riverpod/shared/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeProvider = StateNotifierProvider<AppThemeModeNotifier, ThemeMode>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return AppThemeModeNotifier(storage);
},
);

class AppThemeModeNotifier extends StateNotifier<ThemeMode> {
  final StorageService storageService;

  ThemeMode currentTheme = ThemeMode.light;

  AppThemeModeNotifier(this.storageService) : super(ThemeMode.light) {
    getCurrentTheme();
  }

  void toggleTheme() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    storageService.set(APP_THEME_STORAGE_KEY, state.name);
  }

  void getCurrentTheme() async {
    final theme = await storageService.get(APP_THEME_STORAGE_KEY);
    final value = ThemeMode.values.byName('${theme ?? 'light'}');
    state = value;
  }
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: AppTextStyles.fontFamily,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.lightGrey,
        error: AppColors.error,
        background: AppColors.black,
      ),
      // backgroundColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.black,
      textTheme: TextThemes.darkTextTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.black,
        titleTextStyle: AppTextStyles.h2,
      ),
    );
  }

  /// Light theme data of the app
  static ThemeData get lightTheme {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        textTheme: TextThemes.textTheme,
        primaryTextTheme: TextThemes.primaryTextTheme,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.lightGrey,
          error: AppColors.error,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.primary,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          // elevation: ,
          selectedIconTheme: IconThemeData(
            size: 5,
            fill: 0.5,
            weight: 1,
            grade: 2.5,
            opticalSize: 1.5,
            opacity: .8,
            color: Colors.blue,
            shadows: [
              Shadow(
                  color: Colors.black54,
                  offset: Offset(1, 1),
                  blurRadius: .5
              ),
            ],
          ),
          unselectedIconTheme: IconThemeData(
            size: 5,
            fill: 0.5,
            weight: 1,
            grade: 2.5,
            opticalSize: 1.5,
            opacity: .8,
            color: Colors.black,
            shadows: [
              Shadow(
                  color: Colors.black54,
                  offset: Offset(1, 1),
                  blurRadius: .5
              ),
            ],
          ),
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
            color: Colors.blue,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
          // showSelectedLabels: ,
          // showUnselectedLabels: ,
          // type: ,
          // enableFeedback: ,
          // landscapeLayout: ,
          // mouseCursor: ,
        )
    );
  }
}