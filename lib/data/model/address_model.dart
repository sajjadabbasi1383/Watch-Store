class Address {
  String? address;
  double? lat;
  double? lng;
  String? postalCode;

  Address({this.address, this.lat, this.lng, this.postalCode});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
    postalCode = json['postal_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['lat'] = lat;
    data['lng'] = lng;
    data['postal_code'] = postalCode;
    return data;
  }
}