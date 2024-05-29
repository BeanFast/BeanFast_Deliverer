import 'package:get/get.dart';

import '/models/session_detail.dart';
import '/services/api_service.dart';

class SessionService {
  final String baseUrl = 'SessionDetails';
  final ApiService _apiService = Get.put(ApiService());

  Future<List<SessionDetail>> getScheduleById() async {
    List<SessionDetail> list = [];
    final response = await _apiService.request.get('$baseUrl/deliveryschedule');
    for (var e in response.data['data']) {
      var sessionDetail = SessionDetail.fromJson(e);
      list.add(sessionDetail);
    }
    return list;
  }
}
