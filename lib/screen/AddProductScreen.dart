import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  // Step 2: Create controllers to capture input
  final TextEditingController nameController = TextEditingController();
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Step 3: Add input fields for name, barcode, and price
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: barcodeController,
              decoration: InputDecoration(
                labelText: 'Barcode',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number, // Make it a numeric input
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Step 4: Collect data from input fields and pass it back
                String name = nameController.text;
                String barcode = barcodeController.text;
                double? price = double.tryParse(priceController.text);

                if (name.isNotEmpty && barcode.isNotEmpty && price != null) {
                  // Create a new product map
                  Map<String, dynamic> newProduct = {
                    'name': name,
                    'barcode': barcode,
                    'price': price,
                  };

                  // Return the new product to the previous screen
                  Navigator.pop(context, newProduct);
                } else {
                  // Show an error message if any field is invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill all fields with valid data')),
                  );
                }
              },
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
