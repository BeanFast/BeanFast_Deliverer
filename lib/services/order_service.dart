import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../utils/logger.dart';
import '/enums/status_enum.dart';
import '/models/food.dart';
import '/models/order.dart';
import '/services/api_service.dart';
import 'food_service.dart';

class OrderService {
  final String baseUrl = 'orders';
  final ApiService _apiService = getx.Get.put(ApiService());

  Future<List<Order>> getByQRCode(String qrCodeString) async {
    final response = await _apiService.request
        .get('$baseUrl/getOrderByQrCode?qrCode=$qrCodeString');
    List<Order> list = [];
    logger.e(response.data['data']);
    // for (var e in response.data['data']) {
    //   list.add(Order.fromJson(e));
    //   var order = list.last;
    //   var responseFood =
    //       await FoodService().getById(order.orderDetails![0].foodId!);
    //   order.orderDetails![0].food = Food.fromJson(responseFood.data['data']);
    // }
    return list;
  }

  Future<Order> getById(String id) async {
    final response = await _apiService.request.get('food/$id');
    return Order.fromJson(response.data['data']);
  }
}
