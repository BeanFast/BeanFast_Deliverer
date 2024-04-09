import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '/utils/logger.dart';

class QRScanController extends GetxController {
  var qrData = Rx<String?>(null);
  final qrKey = GlobalKey(debugLabel: 'QR');

  void onQRViewCreated(QRViewController controller) {
    qrData.value = null;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        qrData.value = scanData.code ?? '';
        logger.e('qrData - ${qrData.value}');
        Get.back();
      }
    });
  }
}
