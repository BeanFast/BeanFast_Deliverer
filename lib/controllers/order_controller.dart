import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '/views/screens/splash_screen.dart';
import '/models/order.dart';
import '/services/order_service.dart';

class OrderController extends GetxController {
  Rx<Order> model = Order().obs;

  Future getById(String id) async {
    try {
      model.value = await OrderService().getById(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future completeOrderStatus(String id) async {
    try {
      await OrderService().completeOrderStatus(id);
      Get.snackbar('Thông báo', 'Giao hàng thành công');
      Get.offAll(const SplashScreen());
    } on DioException catch (e) {
      Get.snackbar('Thất bại', e.response!.data['message']);
    }
  }
}
