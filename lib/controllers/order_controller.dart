import 'package:beanfast_deliverer/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;

import '/models/order.dart';
import '/services/order_service.dart';
import '/enums/status_enum.dart';

class OrderController extends getx.GetxController {
  getx.RxList<Order> listData = <Order>[].obs;
  getx.Rx<Order> model = Order().obs;
  OrderStatus orderStatus = OrderStatus.preparing;
  getx.Rx<DateTime> selectedDate = DateTime.now().obs;
  getx.RxString dropdownValue = 'Hoàn thành 1'.obs;

  getx.Rx<DateTimeRange> selectedDateRange = getx.Rx<DateTimeRange>(
    DateTimeRange(
      start: DateTime.now().subtract(Duration(days: 7)),
      end: DateTime.now(),
    ),
  );

  void updateStatus(String status) {
    dropdownValue.value = status;
  }

  Future getById(String id) async {
    try {
      model.value = await OrderService().getById(id);
      print("aaa");
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future getByStatus() async {
  //   try {
  //     String qrCode = '3e24d372-1776-4dc2-81f3-a6322317aad3';
  //     listData.value = await OrderService().getByQRCode(qrCode);
  //     listData.sort((a, b) => b.paymentDate!.compareTo(a.paymentDate!));
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  Future<bool> completeOrderStatus(String id) async {
    logger.e(id);
    try {
      Response response = await OrderService().completeOrderStatus(id);
      if (response.statusCode == 200) {
        return true;
      }
      logger.e('completeOrderStatus - ${response.statusCode}');
      return false;
    } on DioException catch (e) {
      logger.e('DioException - ${e.response!.statusCode}');
      e.response!.data['message'];
      return false;
    }
  }
}
