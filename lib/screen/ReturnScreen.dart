import 'package:flutter/material.dart';
import 'package:posnext_mobile/screen/POSScreen.dart';

class SaleReturnScreen extends StatefulWidget {
  @override
  _SaleReturnScreenState createState() => _SaleReturnScreenState();
}

class _SaleReturnScreenState extends State<SaleReturnScreen> {
  TextEditingController productController = TextEditingController();
  Map<String, dynamic>? selectedProduct;

  // Function to search product by barcode or name
  void searchProduct(String query) {
    final foundProduct = salesReport.expand((transaction) => transaction['items']).firstWhere(
          (item) =>
      item['name'].toLowerCase() == query.toLowerCase() || item['barcode'] == query,
      orElse: () => null,
    );

    setState(() {
      selectedProduct = foundProduct;
    });
  }

  // Function to process the return (remove from salesReport)
  void processReturn(String paymentMethod) {
    if (selectedProduct != null) {
      setState(() {
        bool productRemoved = false; // To track if the product was removed

        // Iterate through salesReport and remove the selected product
        for (var transaction in salesReport) {
          if (transaction['items'].contains(selectedProduct)) {
            transaction['items'].remove(selectedProduct);
            transaction['total'] -= (selectedProduct!['price'] ?? 0) * (selectedProduct!['quantity'] ?? 0);
            productRemoved = true; // Set flag to true if product is removed

            // Adjust the corresponding payment method totals
            if (transaction['paymentMethod'] == paymentMethod) {
              if (paymentMethod == 'Cash') {
               // totalCashSales -= (selectedProduct!['price'] ?? 0) * (selectedProduct!['quantity'] ?? 0);
              } else if (paymentMethod == 'Card') {
              //  totalCardSales -= (selectedProduct!['price'] ?? 0) * (selectedProduct!['quantity'] ?? 0);
              }
            }
          }
        }

        // Check if product was removed successfully
        if (!productRemoved) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Product not found in sales report.'),
          ));
        }

        // Clear the selected product after return
        selectedProduct = null;
        productController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sale Return'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Input field for barcode or name
            TextField(
              controller: productController,
              decoration: InputDecoration(
                labelText: 'Enter product barcode or name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    searchProduct(productController.text);
                  },
                ),
              ),
            ),
            SizedBox(height: 20),

            // Display selected product details (if found)
            selectedProduct != null
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product: ${selectedProduct!['name']}'),
                Text('Quantity: ${selectedProduct!['quantity']}'),
                Text('Price: PKR ${selectedProduct!['price'].toStringAsFixed(2)}'),
                SizedBox(height: 20),

                // Buttons for Cash or Card return
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => processReturn('Cash'),
                      child: Text('Return via Cash'),
                    ),
                    ElevatedButton(
                      onPressed: () => processReturn('Card'),
                      child: Text('Return via Card'),
                    ),
                  ],
                ),
              ],
            )
                : Text('No product selected'),
          ],
        ),
      ),
    );
  }
}






