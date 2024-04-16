import 'dart:convert';

class UserModel {
  final String name;
  final String phone;
  final String address;
  final String postalCode;
  final image;
  final double lat;
  final double lng;

  UserModel({
    required this.name,
    required this.phone,
    required this.postalCode,
    required this.address,
    required this.image,
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'postal_code': postalCode,
      'image': image,
      'lat': lat,
      'lng': lng,
    };
  }

  factory UserModel.fromJson(String? jsonString) {
    Map<String, dynamic> map = jsonDecode(jsonString!);
    return UserModel(
        name: map['name'],
        phone: map['phone'],
        postalCode: map['postal_code'],
        address: map['address'],
        image: map['image'],
        lat: map['lat'],
        lng: map['lng']);
  }
}
