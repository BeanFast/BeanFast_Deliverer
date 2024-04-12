import 'package:beanfast_deliverer/services/order_service.dart';
import 'package:beanfast_deliverer/views/screens/order_delivery_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../models/order.dart';
import '/utils/logger.dart';

class QRScanController extends GetxController {
  var qrData = Rx<String?>(null);
  final qrKey = GlobalKey(debugLabel: 'QR');

  void onQRViewCreated(QRViewController controller) {
    qrData.value = null;
    controller.scannedDataStream.listen((scanData) async {
      if (scanData.code != null) {
        qrData.value = scanData.code ?? '';
        logger.e('qrData - ${qrData.value}');
        try {
          List<Order> list = await OrderService().getByQrCode(qrData.value!);

          Get.to(OrderDeliveryListScreen(list: list));
        } on DioException catch (e) {
          e.response!.data['message'];
          Get.to(const OrderDeliveryListScreen(list: []));
        }
      }
    });
  }
}
