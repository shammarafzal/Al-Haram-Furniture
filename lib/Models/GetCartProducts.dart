// To parse this JSON data, do
//
//     final getCartProducts = getCartProductsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetCartProducts getCartProductsFromJson(String str) => GetCartProducts.fromJson(json.decode(str));

String getCartProductsToJson(GetCartProducts data) => json.encode(data.toJson());

class GetCartProducts {
  GetCartProducts({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory GetCartProducts.fromJson(Map<String, dynamic> json) => GetCartProducts(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.userId,
    required this.orderDate,
    required this.orderStatus,
    required this.paymentMethod,
    required this.orderType,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
  });

  int id;
  String userId;
  String orderDate;
  String orderStatus;
  dynamic paymentMethod;
  String orderType;
  DateTime createdAt;
  DateTime updatedAt;
  List<Product> products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userId: json["user_id"],
    orderDate: json["order_date"],
    orderStatus: json["order_status"],
    paymentMethod: json["payment_method"],
    orderType: json["order_type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "order_date": orderDate,
    "order_status": orderStatus,
    "payment_method": paymentMethod,
    "order_type": orderType,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    required this.id,
    required this.categoryId,
    required this.companyId,
    required this.modelName,
    required this.description,
    required this.salePrice,
    required this.costPrice,
    required this.qty,
    required this.isPopular,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
    required this.sizes,
    required this.category,
    required this.colors,
    required this.company,
    required this.productGalleries,
  });

  int id;
  String categoryId;
  String companyId;
  String modelName;
  String description;
  String salePrice;
  String costPrice;
  String qty;
  String isPopular;
  DateTime createdAt;
  DateTime updatedAt;
  ProductPivot pivot;
  List<Size> sizes;
  Category category;
  List<Color> colors;
  Company company;
  List<ProductGallery> productGalleries;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    categoryId: json["category_id"],
    companyId: json["company_id"],
    modelName: json["model_name"],
    description: json["description"],
    salePrice: json["sale_price"],
    costPrice: json["cost_price"],
    qty: json["qty"],
    isPopular: json["is_popular"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: ProductPivot.fromJson(json["pivot"]),
    sizes: List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
    category: Category.fromJson(json["category"]),
    colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
    company: Company.fromJson(json["company"]),
    productGalleries: List<ProductGallery>.from(json["product_galleries"].map((x) => ProductGallery.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "company_id": companyId,
    "model_name": modelName,
    "description": description,
    "sale_price": salePrice,
    "cost_price": costPrice,
    "qty": qty,
    "is_popular": isPopular,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
    "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
    "category": category.toJson(),
    "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
    "company": company.toJson(),
    "product_galleries": List<dynamic>.from(productGalleries.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    required this.id,
    required this.categoryName,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String categoryName;
  String icon;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    categoryName: json["category_name"],
    icon: json["icon"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "icon": icon,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Color {
  Color({
    required this.id,
    required this.colorName,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  int id;
  String colorName;
  DateTime createdAt;
  DateTime updatedAt;
  ColorPivot pivot;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
    id: json["id"],
    colorName: json["color_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: ColorPivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "color_name": colorName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
  };
}

class ColorPivot {
  ColorPivot({
    required this.productId,
    required this.colorId,
  });

  String productId;
  String colorId;

  factory ColorPivot.fromJson(Map<String, dynamic> json) => ColorPivot(
    productId: json["product_id"],
    colorId: json["color_id"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "color_id": colorId,
  };
}

class Company {
  Company({
    required this.id,
    required this.companyName,
    required this.companyPhone,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String companyName;
  String companyPhone;
  DateTime createdAt;
  DateTime updatedAt;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    companyName: json["company_name"],
    companyPhone: json["company_phone"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_name": companyName,
    "company_phone": companyPhone,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class ProductPivot {
  ProductPivot({
    required this.orderId,
    required this.productId,
    required this.qty,
    required this.size,
    required this.color,
    required this.total,
    required this.createdAt,
    required this.updatedAt,
  });

  String orderId;
  String productId;
  String qty;
  String size;
  String color;
  String total;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductPivot.fromJson(Map<String, dynamic> json) => ProductPivot(
    orderId: json["order_id"],
    productId: json["product_id"],
    qty: json["qty"],
    size: json["size"],
    color: json["color"],
    total: json["total"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "product_id": productId,
    "qty": qty,
    "size": size,
    "color": color,
    "total": total,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class ProductGallery {
  ProductGallery({
    required this.id,
    required this.productId,
    required this.productImage,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String productId;
  String productImage;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductGallery.fromJson(Map<String, dynamic> json) => ProductGallery(
    id: json["id"],
    productId: json["product_id"],
    productImage: json["product_image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "product_image": productImage,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Size {
  Size({
    required this.id,
    required this.sizeName,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  int id;
  String sizeName;
  DateTime createdAt;
  DateTime updatedAt;
  SizePivot pivot;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    id: json["id"],
    sizeName: json["size_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: SizePivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "size_name": sizeName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
  };
}

class SizePivot {
  SizePivot({
    required this.productId,
    required this.sizeId,
  });

  String productId;
  String sizeId;

  factory SizePivot.fromJson(Map<String, dynamic> json) => SizePivot(
    productId: json["product_id"],
    sizeId: json["size_id"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "size_id": sizeId,
  };
}
