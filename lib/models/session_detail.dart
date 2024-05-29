import 'base_model.dart';
import 'exchange_gift.dart';
import 'location.dart';
import 'order.dart';
import 'session.dart';
import 'user.dart';

class SessionDetail extends BaseModel {
  String? locationId;
  String? sessionId;
  String? delivererId;
  String? code;
  Location? location;
  Session? session;
  User? deliverer;
  List<Order>? orders;
  List<ExchangeGift>? exchangeGifts;

  SessionDetail({
    id,
    status,
    this.locationId,
    this.sessionId,
    this.delivererId,
    this.code,
    this.location,
    this.session,
    this.orders,
    this.exchangeGifts,
    this.deliverer,
  }) : super(id: id, status: status);

  factory SessionDetail.fromJson(dynamic json) => SessionDetail(
        id: json["id"],
        status: json['status'],
        locationId: json["locationId"],
        sessionId: json['sessionId'],
        delivererId: json['delivererId'],
        code: json['code'],
        location: json['location'] == null
            ? Location()
            : Location.fromJson(json['location']),
        session: json['session'] == null
            ? Session()
            : Session.fromJson(json['session']),
        orders: json['orders']?.map<Order>((item) {
          return Order.fromJson(item);
        }).toList(),
        exchangeGifts: json['exchangeGifts']?.map<ExchangeGift>((item) {
          return ExchangeGift.fromJson(item);
        }).toList(),
        deliverer: json['deliverer'] == null
            ? User()
            : User.fromJson(json['deliverer']),
      );
}
