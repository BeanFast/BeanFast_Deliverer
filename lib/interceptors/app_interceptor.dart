import 'package:dio/dio.dart';

import '/controllers/auth_controller.dart';
import '/utils/logger.dart';

class AppInterceptor extends Interceptor with CacheManager {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? token = getToken();
    // if (token != null) {
    //   Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    //   final expiryTimestamp = decodedToken["exp"];
    //   final currentTime = DateTime.now().millisecondsSinceEpoch;
    //   if (currentTime >= expiryTimestamp) {
    //     logger.e(currentTime >= expiryTimestamp);
    //       // removeToken();
    //     AuthController().changeAuthState(AuthState.unauthenticated);
    //     logger.e('onRequest');
    //     // return;
    //   } else {
    options.headers['Authorization'] = 'Bearer $token';
    //   }
    // }

    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i('onResponse');
    return super.onResponse(response, handler);
  }

  @override
  onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e('onError - $err');

    if (err.response?.statusCode == 401) {
      logger.e('end');
    }
    // if (err.response?.statusCode == 400 || err.response?.statusCode == 500) {
    //   // Xử lý lỗi 400 hoặc 500 ở đây
    //   print('Error ${err.response?.statusCode}: ${err.message}');

    //   // Điều hướng đến trang cụ thể trong GetX

    //   Get.off('/error_page');

    //   // Để ngăn chặn xử lý lỗi tiếp theo, không gọi handler.next(error);
    //   return;
    // }

    return super.onError(err, handler);
  }
}
