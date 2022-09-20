// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserData {
  String? name;
  String? phone;

  UserData({
    this.name,
    this.phone,
  });

  // UserData.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   phone = json['phone'];
  // }

  static UserData fromJson(json) {
    return UserData(name: json['name'], phone: json['phone']);
  }
}
