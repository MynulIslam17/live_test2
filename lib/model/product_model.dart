class Product {
  final String id;
  final String name;
  final int code;
  final String? img;
  final int qty;
  final int unitPrice;
  final int totalPrice;

  Product({
    required this.id,
    required this.name,
    required this.code,
    this.img,
    required this.qty,
    required this.unitPrice,
    required this.totalPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] ?? '',
      name: json['ProductName'] ?? '',
      code: json['ProductCode'] ?? 0,
      img: json['Img'],
      qty: json['Qty'] ?? 0,
      unitPrice: json['UnitPrice'] ?? 0,
      totalPrice: json['TotalPrice'] ?? 0,
    );
  }
}