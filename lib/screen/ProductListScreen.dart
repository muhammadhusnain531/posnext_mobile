import 'package:flutter/material.dart';
import 'package:posnext_mobile/screen/AddProductScreen.dart';

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
  // Function to refresh the list after adding a product
  void refreshList() {
    setState(() {}); // Trigger rebuild to reflect the updated product list
  }

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
      // Step 1: Add FloatingActionButton to open AddProductScreen
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to AddProductScreen and wait for result
          final newProduct = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductScreen()),
          );
          if (newProduct != null) {
            // Add the new product to the list
            setState(() {
              products.add(newProduct);
            });
          }
        },
        child: Icon(Icons.add),
        tooltip: 'Add Product',
      ),
    );
  }
}
