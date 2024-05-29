import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '/models/exchange_gift.dart';
import '/services/order_service.dart';
import '/views/screens/order_delivery_list.dart';
import '/models/order.dart';
import '/services/exchange_gift_service.dart';
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
        List<Order> orderlist = [];
        List<ExchangeGift> exchangeGiftlist = [];
        try {
          orderlist = await OrderService().getByQrCode(qrData.value!);
        } on DioException catch (e) {
          e.response!.data['message'];
        }
        try {
          exchangeGiftlist =
              await ExchangeGiftService().getByQrCode(qrData.value!);
        } on DioException catch (e) {
          e.response!.data['message'];
        }
        Get.to(OrderDeliveryListScreen(
          orderList: orderlist,
          exchangeGiftList: exchangeGiftlist,
          deliverable: true,
        ));
      }
    });
  }
}
