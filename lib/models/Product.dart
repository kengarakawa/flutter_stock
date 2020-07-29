import 'dart:convert';

List<Product> productFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Product>.from(data.map((item) => Product.fromJson(item)));
}

String productToJson(Product data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

class Product {

  // Properties
  int id;
  String productName;
  String productDetail;
  String productBarcode;
  int productQty;
  String productPrice;
  String productImage;
  String productCategory;
  int productStatus;
  DateTime createdAt;
  DateTime updatedAt;

  // Constructor
  Product({
    this.id,
    this.productName,
    this.productDetail,
    this.productBarcode,
    this.productQty,
    this.productPrice,
    this.productImage,
    this.productCategory,
    this.productStatus,
    this.createdAt,
    this.updatedAt,
  });
  
  
  factory Product.fromJson(Map<String, dynamic> json) => Product(
id: json["id"] == null ? null : json["id"],
        productName: json["product_name"] == null ? null : json["product_name"],
        productDetail: json["product_detail"] == null ? null : json["product_detail"],
        productBarcode: json["product_barcode"] == null ? null : json["product_barcode"],
        productQty: json["product_qty"] == null ? null : json["product_qty"],
        productPrice: json["product_price"] == null ? null : json["product_price"],
        productImage: json["product_image"] == null ? null : json["product_image"],
        productCategory: json["product_category"] == null ? null : json["product_category"],
        productStatus: json["product_status"] == null ? null : json["product_status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  // Map to json
  Map<String, dynamic> toJson() => {
      "id": id == null ? null : id,
      "product_name": productName == null ? null : productName,
      "product_detail": productDetail == null ? null : productDetail,
      "product_barcode": productBarcode == null ? null : productBarcode,
      "product_qty": productQty == null ? null : productQty,
      "product_price": productPrice == null ? null : productPrice,
      "product_image": productImage == null ? null : productImage,
      "product_category": productCategory == null ? null : productCategory,
      "product_status": productStatus == null ? null : productStatus,
      "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };

  // to string
  @override
  String toString() {
    return 'Product(id: $id, productName: $productName, productDetail: $productDetail, productBarcode: $productBarcode, productQty: $productQty, productPrice: $productPrice, productImage: $productImage, productCategory: $productCategory, productStatus: $productStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

}
