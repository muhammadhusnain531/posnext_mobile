import 'package:flutter/material.dart';

class BillDetailsScreen extends StatelessWidget {
  final Map<String, dynamic>? transaction;

  BillDetailsScreen({required this.transaction});

  @override
  Widget build(BuildContext context) {
    if (transaction == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Bill Details'),
        ),
        body: Center(
          child: Text('No transaction details available.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Details - ${transaction!['billNo'] ?? 'Unknown'}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Payment Method: ${transaction!['paymentMethod'] ?? 'Unknown'}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total: PKR ${transaction!['total']?.toStringAsFixed(2) ?? '0.00'}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Date: ${transaction!['date'] ?? 'Unknown'}'),
          ),
          Divider(),
          Expanded(
            child: transaction!['items'] == null
                ? Center(child: Text('No items available'))
                : ListView.builder(
              itemCount: (transaction!['items'] as List).length,
              itemBuilder: (context, index) {
                final item = transaction!['items'][index];
                return ListTile(
                  title: Text(item['name'] ?? 'Unknown'),
                  subtitle: Text('Quantity: ${item['quantity'] ?? 0}'),
                  trailing: Text('PKR ${item['price']?.toStringAsFixed(2) ?? '0.00'}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
