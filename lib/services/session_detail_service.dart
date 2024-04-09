import 'package:beanfast_deliverer/models/session_detail.dart';

import '/models/session.dart';
import 'package:get/get.dart' as getx;

import '/services/api_service.dart';

class SessionService {
  final String baseUrl = 'SessionDetails';
  final ApiService _apiService = getx.Get.put(ApiService());

  // Future<List<Session>> getSessionsBySchoolId(
  //     String schoolId, DateTime dateTime) async {
  //   String date = DateFormat('yyyy-MM-dd').format(dateTime);
  //   final response = await _apiService.request
  //       .get('$baseUrl?Orderable=true&SchoolId=$schoolId&DeliveryTime=$date');
  //   List<Session> list = [];
  //   for (var e in response.data['data']) {
  //     list.add(Session.fromJson(e));
  //   }
  //   return list;
  // }

  Future<List<SessionDetail>> getScheduleById(String delivererId) async {
    List<SessionDetail> list = [];
    final response = await _apiService.request.get('$baseUrl/deliveryschedule/$delivererId');
    for (var e in response.data['data']) {
      list.add(SessionDetail.fromJson(e));
    }
    return list;
  }
}
