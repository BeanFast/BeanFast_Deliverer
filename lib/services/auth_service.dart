import '/models/user.dart';
import '/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '/services/api_service.dart';

class AuthService {
  final String baseUrl = 'auth';
  final ApiService _apiService = getx.Get.put(ApiService());
  Future<Response> login(String email, String password) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    final response =
        await _apiService.request.post('$baseUrl/login', data: data);
    logger.e(response.data);
    return response;
  }

  Future<User> getUser() async {
    logger.e('getUser');
    final response = await _apiService.request.get('$baseUrl/current');
    return User.fromJson(response.data['data']);
  }
}
