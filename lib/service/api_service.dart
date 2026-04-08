import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';


class ApiService {
  static const String url =
      "http://35.73.30.144:2008/api/v1/ReadProduct";

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      if (decoded['status'] == 'success') {
        List data = decoded['data'];
        return data.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception("API failed");
      }
    } else {
      throw Exception("Server error");
    }
  }
}