import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '/enums/auth_state_enum.dart';
import '/services/auth_service.dart';
import '/utils/constants.dart';
import '/utils/logger.dart';

class AuthController extends GetxController with CacheManager {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxString errorMessage = ''.obs;
  var isPasswordVisible = true.obs;
  var isChecked = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleIschecked() {
    isChecked.value = !isChecked.value;
  }

  void changeAuthState(AuthState newState) {
    authState.value = newState;
  }

  void checkLoginStatus() {
    final String? token = getToken();
    logger.e('token - ${token}');
    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      int exp = decodedToken['exp'];
      DateTime expirationDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
      if (expirationDate.isAfter(DateTime.now())) {
        changeAuthState(AuthState.authenticated);
        return;
      }
    }
    logOut();
  }

  Future getCurrentUser() async {
    try {
      currentUser.value = await AuthService().getUser();
    } on DioException catch (e) {
      Get.snackbar('Lỗi', e.response!.data['message']);
    }
  }

  void login() async {
    errorMessage.value = '';
    // emailController.text = 'deliverer02.beanfast@gmail.com';
    // passwordController.text = '12345678';
    try {
      logger.e('login');
      var response = await AuthService()
          .login(emailController.text, passwordController.text);
      if (response.statusCode == 200) {
        changeAuthState(AuthState.authenticated);
        await saveToken(response.data['data']['accessToken']);
        // changePage(MenuIndexState.home.index);
        // Get.offAll(const SplashScreen());
      }
    } on DioException catch (e) {
      Get.snackbar('Lỗi', e.response!.data['']);
    }
  }

  void clear() {
    currentUser.value = null;
  }

  void logOut() {
    clear();
    changeAuthState(AuthState.unauthenticated);
    removeToken();
  }
}

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.DELIVERERTOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.DELIVERERTOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.DELIVERERTOKEN.toString());
  }
}

// ignore: constant_identifier_names
enum CacheManagerKey { DELIVERERTOKEN }
