import '/utils/constants.dart';
import 'base_model.dart';
import 'exchange_gift.dart';
import 'order.dart';
import 'school.dart';
import 'user.dart';

class Profile extends BaseModel {
  String? userId;
  String? schoolId;
  String? code;
  String? fullName;
  bool? gender;
  String? nickName;
  String? avatarPath;
  DateTime? dob;
  String? className;
  double? currentBMI;
  User? user;
  School? school;
  List<Order>? orders;
  List<ExchangeGift>? exchangeGifts;

  Profile({
    id,
    status,
    this.userId,
    this.schoolId,
    this.code,
    this.fullName,
    this.gender,
    this.nickName,
    this.avatarPath,
    this.dob,
    this.className,
    this.currentBMI,
    this.school,
  }) : super(id: id, status: status);

  factory Profile.fromJson(dynamic json) {
    School school = School();
    if (json['school'] != null) {
      school = School.fromJson(json['school']);
    } else if (json['schoolName'] != null) {
      school = School(name: json['schoolName']);
    }
    return Profile(
      id: json["id"],
      status: json['status'],
      userId: json["userId"],
      schoolId: json['schoolId'],
      code: json['code'],
      fullName: json['fullName'],
      gender: json['gender'],
      nickName: json['nickName'],
      avatarPath: json['avatarPath'] ?? defaultAvatarImagePath,
      dob: DateTime.parse(json['dob']),
      className: json['class'],
      currentBMI: json['currentBMI'] == null
          ? 0
          : double.parse(json['currentBMI'].toString()),
      school: school,
    );
  }
}
