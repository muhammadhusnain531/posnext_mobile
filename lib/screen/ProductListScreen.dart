
import 'package:flutter/material.dart';
class ProductListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'name': 'Product 1', 'barcode': '12345', 'price': 100.0},
    {'name': 'Product 2', 'barcode': '67890', 'price': 150.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];
          return ListTile(
            title: Text(product['name']),
            subtitle: Text('Barcode: ${product['barcode']}'),
            trailing: Text('Price: \PKR${product['price']}'),
          );
        },
      ),
    );
  }
}