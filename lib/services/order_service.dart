import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../utils/logger.dart';
import '/models/food.dart';
import '/models/order.dart';
import '/services/api_service.dart';
import 'food_service.dart';

class OrderService {
  final String baseUrl = 'orders';
  final ApiService _apiService = getx.Get.put(ApiService());

  // Future<List<Order>> getByQRCode(String qrCodeString) async {
  //   final response = await _apiService.request
  //       .get('$baseUrl/getOrderByQrCode?qrCode=$qrCodeString');
  //   List<Order> list = [];
  //   logger.e(response.data['data']);
  //   for (var e in response.data['data']) {
  //     list.add(Order.fromJson(e));
  //     var order = list.last;
  //     var responseFood =
  //         await FoodService().getById(order.orderDetails![0].foodId!);
  //     order.orderDetails![0].food = Food.fromJson(responseFood.data['data']);
  //   }
  //   return list;
  // }

  Future<Order> getById(String id) async {
    final response = await _apiService.request.get('$baseUrl/$id');
    var orderJson = response.data['data'];
    Order order = Order.fromJson(orderJson);
    for (var i = 0; i < order.orderDetails!.length; i++) {
      var foodJson = orderJson["orderDetails"][i]["food"];
      // var responseFood =
      //     await FoodService().getById(order.orderDetails![i].foodId!);
      order.orderDetails![i].food = Food.fromJson(foodJson);
    }
    return order;
  }

  Future<List<Order>> getByQrCode(String qrCode) async {
    final response = await _apiService.request
        .get('$baseUrl/getOrderByQrCode?qrCode=$qrCode');
    List<Order> list = [];
    for (var e in response.data['data']) {
      list.add(Order.fromJson(e));
    }
    return list;
  }

  Future<Response> completeOrderStatus(String id) async {
    final response = await _apiService.request.put('$baseUrl/complete/$id');
    return response;
  }
}
