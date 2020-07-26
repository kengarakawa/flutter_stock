// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        this.success,
        this.data,
        this.message,
    });

    bool success;
    List<Datum> data;
    String message;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message == null ? null : message,
    };
}

class Datum {
    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
}
