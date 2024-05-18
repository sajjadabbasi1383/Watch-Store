class CartModel {
  int? id;
  int? productId;
  String? product;
  int? count;
  int? price;
  int? discount;
  int? discountPrice;
  String? image;
  bool countLoading = false;
  bool deleteLoading = false;

  CartModel({
    this.id,
    this.productId,
    this.product,
    this.count,
    required this.price,
    required this.discount,
    required this.image,
    required this.discountPrice,
    this.countLoading = false,
    this.deleteLoading = false,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    product = json['product'];
    count = json['count'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    image = json['image'];
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
