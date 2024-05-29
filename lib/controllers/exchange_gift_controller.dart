import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '/models/exchange_gift.dart';
import '/services/exchange_gift_service.dart';
import '/views/screens/delivery_schedules_screen.dart';

class ExchangeGiftController extends GetxController {
 Rx<ExchangeGift?> model = Rx<ExchangeGift?>(null);

  Future getById(String id) async {
    try {
      model.value = await ExchangeGiftService().getById(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future completeOrderStatus(String id) async {
    try {
      await ExchangeGiftService().completeStatus(id);
      Get.snackbar('Thông báo', 'Giao hàng thành công');
      Get.off(const DeliveryScheduleScreen());
    } on DioException catch (e) {
      Get.snackbar('Thất bại', e.response!.data['message']);
    }
  }
}

