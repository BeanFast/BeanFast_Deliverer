import 'package:beanfast_deliverer/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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

class QRScanScreen extends GetView<QRScanController> {

  const QRScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QRScanController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scan Screen'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            bottom: 70,
            child: QRView(
              key: controller.qrKey,
              onQRViewCreated: controller.onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.white,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => Text('QR Data: ${controller.qrData.value}',
                        textAlign: TextAlign.center),
                  ),
                  const Icon(Icons.qr_code_scanner, size: 30),
                  const Text('Đang quét mã QR...'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
