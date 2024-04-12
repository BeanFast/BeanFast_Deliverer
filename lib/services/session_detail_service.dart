import 'package:beanfast_deliverer/models/session_detail.dart';

import '/models/session.dart';
import 'package:get/get.dart' as getx;

import '/services/api_service.dart';

class SessionService {
  final String baseUrl = 'SessionDetails';
  final ApiService _apiService = getx.Get.put(ApiService());

  Future<List<SessionDetail>> getScheduleById() async {
    List<SessionDetail> list = [];
    final response = await _apiService.request.get('$baseUrl/deliveryschedule');
    for (var e in response.data['data']) {
      list.add(SessionDetail.fromJson(e));
    }
    return list;
  }
}
