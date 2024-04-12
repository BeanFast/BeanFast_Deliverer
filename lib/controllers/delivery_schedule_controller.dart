import 'package:beanfast_deliverer/utils/logger.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/models/session_detail.dart';
import '/services/session_detail_service.dart';

class DeliveryScheduleController extends GetxController {
  RxList<SessionDetail> listData = <SessionDetail>[].obs;
  RxMap<String, Map<String, SessionDetail>> map =
      <String, Map<String, SessionDetail>>{}.obs;
  Map<String, RxBool> panelVisibility = <String, RxBool>{};

  Future getDeliveryschedule() async {
    try {
      listData.value = await SessionService().getScheduleById();
      for (var e in listData) {
        String key =
            DateFormat('dd/MM/yy').format(e.session!.deliveryStartTime!);
        if (map.containsKey(key)) {
          map[key]!.update(e.id!, (value) => e, ifAbsent: () => e);
        } else {
          map.putIfAbsent(key, () => {e.id!: e});
          panelVisibility.putIfAbsent(key, () => true.obs);
        }
        // map.update(DateFormat('dd/MM/yy').format(e.session!.deliveryStartTime!), (value) => )
      }
      logger.e(map);
      // listData.sort((a, b) => b.paymentDate!.compareTo(a.paymentDate!));
    } catch (e) {
      throw Exception(e);
    }
  }
}
