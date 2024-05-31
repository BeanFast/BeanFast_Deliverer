import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '/models/exchange_gift.dart';
import '/services/order_service.dart';
import '/views/screens/order_delivery_list.dart';
import '/models/order.dart';
import '/services/exchange_gift_service.dart';

class QRScanController extends GetxController {
  final qrKey = GlobalKey(debugLabel: 'QR');

  void onQRViewCreated(QRViewController controller) {
    String qrData;

    controller.scannedDataStream.listen((scanData) async {
      List<Order> orderlist = [];
      List<ExchangeGift> exchangeGiftlist = [];
      if (scanData.code != null) {
        qrData = scanData.code ?? '';
        try {
          orderlist = await OrderService().getByQrCode(qrData);
        } on DioException catch (e) {
          e.response!.data['message'];
        }
        try {
          exchangeGiftlist = await ExchangeGiftService().getByQrCode(qrData);
        } on DioException catch (e) {
          e.response!.data['message'];
        }
        Get.back();
        Get.to(OrderDeliveryListScreen(
          orderList: orderlist,
          exchangeGiftList: exchangeGiftlist,
          deliverable: true,
        ));
      }
    });
  }
}
