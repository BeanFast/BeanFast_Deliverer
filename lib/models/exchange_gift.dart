import 'base_model.dart';
import 'profile.dart';
import 'gift.dart';
import 'order_activity.dart';
import 'session_detail.dart';

class ExchangeGift extends BaseModel {
  String? profileId;
  String? sessionDetailId;
  String? giftId;
  String? code;
  int? points;
  DateTime? paymentDate;
  DateTime? deliveryDate;
  Profile? profile;
  SessionDetail? sessionDetail;
  Gift? gift;
  List<OrderActivity>? activities;

  ExchangeGift({
    id,
    status,
    this.profileId,
    this.sessionDetailId,
    this.gift,
    this.giftId,
    this.code,
    this.points,
    this.paymentDate,
    this.deliveryDate,
    this.sessionDetail,
    this.profile,
    this.activities,
  }) : super(id: id, status: status);

  factory ExchangeGift.fromJson(dynamic json) => ExchangeGift(
        id: json["id"],
        status: json['status'],
        profileId: json["profileId"],
        sessionDetailId: json['sessionDetailId'],
        gift: json['gift'] == null ? Gift() : Gift.fromJson(json['gift']),
        giftId: json['giftId'],
        code: json['code'],
        points: json['points'],
        paymentDate: json['paymentDate'] == null
            ? null
            : DateTime.parse(json['paymentDate']),
        deliveryDate: json['deliveryDate'] == null
            ? null
            : DateTime.parse(json['deliveryDate']),
        profile:
            json['profile'] != null ? Profile.fromJson(json['profile']) : null,
        activities: json['orderActivities']?.map<OrderActivity>((item) {
          return OrderActivity.fromJson(item);
        }).toList(),
        sessionDetail: json['sessionDetail'] == null
            ? SessionDetail()
            : SessionDetail.fromJson(json['sessionDetail']),
      );
}
