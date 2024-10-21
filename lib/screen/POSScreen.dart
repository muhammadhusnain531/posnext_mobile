import 'package:flutter/material.dart';
import 'dart:math'; // For generating a random bill number
import 'package:intl/intl.dart';
import 'package:posnext_mobile/screen/ProductListScreen.dart'; // For formatting the date

// Global list to store sales transactions
List<Map<String, dynamic>> salesReport = [];

class POSScreen extends StatefulWidget {
  const POSScreen({super.key});

  @override
  State<POSScreen> createState() => _POSScreenState();
}

class _POSScreenState extends State<POSScreen> {
  List<Map<String, dynamic>> cartItems = [];
  double total = 0;

  // Function to add item to the cart
  void addItemToCart(String name, String barcode, double price) {
    setState(() {
      cartItems.add({'name': name, 'barcode': barcode, 'price': price});
      total += price;
    });
  }

  // Function to handle barcode or name submission
  void handleSubmitted(String input) {
    var foundProduct = products.firstWhere(
          (product) => product['barcode'] == input || product['name'].toLowerCase() == input.toLowerCase(),
      orElse: () => {},
    );

    if (foundProduct != null) {
      addItemToCart(foundProduct['name'], foundProduct['barcode'], foundProduct['price']);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product not found')));
    }
  }

  // Function to generate a random bill number
  String generateBillNumber() {
    Random random = Random();
    return (1000 + random.nextInt(9000)).toString(); // Random 4-digit number
  }

  // Function to complete payment
  void completePayment(String method) {
    if (cartItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cart is empty!')));
      return;
    }

    String billNo = generateBillNumber();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

    // Save the transaction to the sales report
    salesReport.add({
      'billNo': billNo,
      'paymentMethod': method,
      'total': total,
      'date': formattedDate,
    });

    setState(() {
      cartItems.clear();
      total = 0;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$method Payment Completed')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'POINT OF SALE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(8.0)),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              label: Text('Scan Barcode or Enter Product Name'),
            ),
            onSubmitted: (value) {
              handleSubmitted(value);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                var item = cartItems[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text('Barcode: ${item['barcode']}'),
                  trailing: Text('PKR:${item['price']}'),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Total amount PKR:${total.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    completePayment('Cash');
                  },
                  child: Text('Cash'),
                ),
                ElevatedButton(
                  onPressed: () {
                    completePayment('Card');
                  },
                  child: Text('Card'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
