import 'package:flutter/material.dart';

// Product list that can be accessed in POSScreen
final List<Map<String, dynamic>> products = [
  {'name': 'Product 1', 'barcode': '12345', 'price': 100.0},
  {'name': 'Product 2', 'barcode': '67890', 'price': 150.0},
  {'name': 'Product 3', 'barcode': '55885', 'price': 120.0},
  {'name': 'Product 4', 'barcode': '56833', 'price': 175.0},
];

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
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
            trailing: Text('Price: PKR ${product['price']}'),
          );
        },
      ),
    );
  }
}
