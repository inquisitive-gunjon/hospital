
import 'package:hospital_riverpod/configs/app_configs.dart';
import 'package:hospital_riverpod/features/auth/domain/models/logIn_request_model.dart';
import 'package:hospital_riverpod/features/auth/presentation/providers/state/auth_state.dart';
import 'package:hospital_riverpod/shared/data/local/shared_prefs_storage_service.dart';
import 'package:hospital_riverpod/shared/data/local/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/exceptions/http_exception.dart';
import '../../../domain/repositories/authentication_repository.dart';



class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository authRepository;


  AuthNotifier({required this.authRepository,}) : super(const AuthState.initial());



  /// -------------------------------------login---------------------------------------------------
  Future<void> adminLogin(String email, String password) async {

    state = const AuthState.loading();
    final response = await authRepository.loginUser(
      user: UserLoginData(email: email, password: password),
    );


    state = await response.fold(
          (failure) {
            return AuthState.failure(failure);
          },
          (logInResponseModel) async {
            StorageService sharedPrefsService=SharedPrefsService();
            sharedPrefsService.init();
            await sharedPrefsService.set("token",logInResponseModel.data!.token!);
            AppConfigs.accessToken = logInResponseModel.data!.token!;
            if (AppConfigs.accessToken!=null) {
              return const AuthState.success();
            }
            return AuthState.failure(CacheFailureException());
          },
    );
  }


  /// -------------------------------------logOut---------------------------------------------------
  Future<void> logOutAdmin() async {

    state = const AuthState.loading();

    StorageService sharedPrefsService=SharedPrefsService();
    sharedPrefsService.init();
    await sharedPrefsService.remove("token");
    AppConfigs.accessToken =null;
    if (AppConfigs.accessToken==null) {
      state= const AuthState.success();
    }
    state= AuthState.failure(CacheFailureException());
  }


}