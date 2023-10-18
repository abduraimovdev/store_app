import 'package:store_app/src/data/models/product.dart';

class CartItem {

  CartItem({
    required this.id,
    required this.product,
    required this.productCount,
    required this.totalPrice,
  });

  factory CartItem.fromJson(Map<String, Object?> json) => CartItem(
      id : json['id']! as String,
      product : ProductModel.fromJson(json['product']! as Map<String, Object?>),
      productCount : json['productCount']! as int,
      totalPrice : json['totalPrice']! as num,
  );
  String id;
  ProductModel product;
  int productCount;
  num totalPrice;

  Map<String, Object?> toJson() => {
    'id' : id,
    'product' : product,
    'productCount' : productCount,
    'totalPrice' : totalPrice,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          product == other.product &&
          productCount == other.productCount &&
          totalPrice == other.totalPrice;

  @override
  int get hashCode =>
      id.hashCode ^
      product.hashCode ^
      productCount.hashCode ^
      totalPrice.hashCode;

  @override
  String toString() => 'CartItem{id: $id, product: $product, productCount: $productCount, totalPrice: $totalPrice}';
}
