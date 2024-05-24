import 'address_model.dart';

class ProfileModel {
  int? id;
  String? name;
  String? mobile;
  String? phone;
  AddressModel? address;

  ProfileModel({this.id, this.name, this.mobile, this.phone, this.address});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    phone = json['phone'];
    address =
        json['address'] != null ? AddressModel.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['phone'] = phone;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    return data;
  }
}


