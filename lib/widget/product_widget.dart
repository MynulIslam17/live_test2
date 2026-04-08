import 'package:flutter/material.dart';
import '../model/product_model.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        leading: product.img != null && product.img!.startsWith('http')
            ? Image.network(product.img!, width: 50, fit: BoxFit.cover)
            : const Icon(Icons.image_not_supported),

        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Code: ${product.code}"),
            Text("Qty: ${product.qty}"),
            Text("Unit Price: ৳${product.unitPrice}"),
          ],
        ),
        trailing: Text(
          "৳${product.totalPrice}",
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ),
    );
  }
}