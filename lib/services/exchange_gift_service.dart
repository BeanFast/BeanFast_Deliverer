import '/models/exchange_gift.dart';
import '/utils/constants.dart';

class ExchangeGiftService {
  final String baseUrl = 'ExchangeGifts';

  Future<ExchangeGift> getById(String id) async {
    final response = await apiService.request.get('$baseUrl/$id');
    ExchangeGift data = ExchangeGift.fromJson(response.data['data']);
    return data;
  }

  Future<List<ExchangeGift>> getByQrCode(String qrCode) async {
    final response = await apiService.request.get('$baseUrl/getExchangeGiftByQrCode',
        queryParameters: Map.from({"qrCode": qrCode}));
    List<ExchangeGift> list = [];
    for (var e in response.data['data']) {
      list.add(ExchangeGift.fromJson(e));
    }
    return list;
  }

  Future<bool> completeStatus(String id) async {
    final response = await apiService.request.put('$baseUrl/complete/$id');
    return response.statusCode == 200;
  }
}
