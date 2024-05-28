import '/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/utils/logger.dart';
import '/controllers/auth_controller.dart';
import '/enums/auth_state_enum.dart';
import 'error_screen.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class SplashScreen extends GetView<AuthController> {
  const SplashScreen({super.key});

  Future<void> initializeSettings() async {
    logger.i('initializeSettings');
    controller.checkLoginStatus();
    if (authState.value == AuthState.authenticated) {
      await controller.getCurrentUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          // if (snapshot.hasError) {
          //   logger.e('snapshot.hasError');
          //   // if (AuthState.unauthenticated) {

          //   // }
          //   return ErrorView(errorMessage: snapshot.error.toString());
          // } else {
          // logger.e('else');
          return Obx(() {
            switch (authState.value) {
              case AuthState.authenticated:
                {
                  return const MainScreen();
                }
              case AuthState.unauthenticated:
                return const LoginView();
              default:
                return const ErrorView(
                    errorMessage: 'Lỗi xác thực đăng nhập'); //
            }
          });
          // }
        }
      },
    );
  }

  Scaffold waitingView() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
