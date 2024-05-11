class CartModel {
  int? id;
  int? productId;
  String? product;
  int? count;

  CartModel({this.id, this.productId, this.product, this.count});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    product = json['product'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['product'] = product;
    data['count'] = count;
    return data;
  }
}
