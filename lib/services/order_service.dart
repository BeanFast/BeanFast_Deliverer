import '/utils/constants.dart';
import '/models/order.dart';

class OrderService {
  final String baseUrl = 'orders';

  Future<Order> getById(String id) async {
    final response = await apiService.request.get('$baseUrl/$id');
    Order order = Order.fromJson(response.data['data']);
    return order;
  }

  Future<List<Order>> getByQrCode(String qrCode) async {
    final response = await apiService.request
        .get('$baseUrl/getOrderByQrCode?qrCode=$qrCode');
    List<Order> list = [];
    for (var e in response.data['data']) {
      list.add(Order.fromJson(e));
    }
    return list;
  }

  Future<bool> completeOrderStatus(String id) async {
    final response = await apiService.request.put('$baseUrl/complete/$id');
    return response.statusCode == 200;
  }
}
