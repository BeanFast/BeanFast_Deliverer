import 'package:get/get.dart';

import '/models/gift.dart';
import '/services/gift_service.dart';
import '/utils/logger.dart';

class ExchangeGiftController extends GetxController {
  RxBool isError = false.obs;
  RxList<Gift> listData = <Gift>[].obs;

  Future getData() async {
    logger.i('getData');
    try {
      var response = await GiftService().getAll();
      List<Gift> list = [];
      for (var e in response.data['data']['items']) {
        // logger.i(e.toString());
        list.add(Gift.fromJson(e));
      }
      listData.value = list;
      logger.i(listData.length.toString());
    } catch (e) {
      isError.value = true;
    }
  }
}
