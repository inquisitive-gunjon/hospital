import 'package:hospital_riverpod/routes/app_router.dart';
import 'package:hospital_riverpod/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
// import '../services/navigation_service/navigation_service.dart';

late RefHolder refHolder;

class RefHolder {
  final WidgetRef _ref;
  RefHolder._(this._ref);

  get ref {
    return _ref;
  }
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    refHolder = RefHolder._(ref);
    final themeMode = ref.watch(appThemeProvider);
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_,child) {
          final appRouter = getIt<AppRouter>();
          return MaterialApp.router(

            title: 'Flutter TDD',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: appRouter.delegate(),
            debugShowCheckedModeBanner: false,
          );
        }
    );
  }
}