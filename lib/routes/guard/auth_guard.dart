
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:hospital_riverpod/configs/app_configs.dart';
import 'package:hospital_riverpod/routes/app_router.dart';
import 'package:hospital_riverpod/shared/data/local/shared_prefs_storage_service.dart';
import 'package:hospital_riverpod/shared/data/local/storage_service.dart';



class AuthGuard extends AutoRouteGuard {
  AuthGuard();
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router)async{

    StorageService sharedPrefsService=SharedPrefsService();
    sharedPrefsService.init();
    final token = await sharedPrefsService.getString("token");
    log("Check token from auth guard ========== > $token");
    log("Check token from auth guard ========== > $token");
    log("Check token from auth guard ========== > $token");

    if (token!=null) {
      AppConfigs.accessToken=token;
      resolver.next(true);
    } else {
      router.push(LogInRoute(onResult: (result) async {
        // if true then go to desired route
        if (result == true) {
          // LandingRoute();
          resolver.next(true);
          // remove login screen from route
          router.removeLast();
        }
        // else stay at login route
      }));
    }
    // bool loggedIn =await storageService.has('logged_in');

  }
}