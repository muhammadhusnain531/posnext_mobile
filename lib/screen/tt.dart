
import 'package:flutter/material.dart';


class POSNextApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS Next Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenuScreen(),
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POS Next Mobile'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.point_of_sale),
              title: Text('POS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => POSScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt),
              title: Text('Sale Report'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SaleReportScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.autorenew),
              title: Text('Return'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReturnScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Product List'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to POS Next Mobile'),
      ),
    );
  }
}

class POSScreen extends StatefulWidget {
  @override
  _POSScreenState createState() => _POSScreenState();
}

class _POSScreenState extends State<POSScreen> {
  List<Map<String, dynamic>> cartItems = [];
  double total = 0;

  void addItemToCart(String name, String barcode, double price) {
    setState(() {
      cartItems.add({'name': name, 'barcode': barcode, 'price': price});
      total += price;
    });
  }

  void completePayment(String method) {
    setState(() {
      // Payment logic here, save the sale
      cartItems.clear();
      total = 0;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$method Payment Completed')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POS Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Scan Product or Enter Name',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                // Dummy data for now
                addItemToCart(value, '12345', 50.0); // Assume all items are $50
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                var item = cartItems[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text('Barcode: ${item['barcode']}'),
                  trailing: Text('Price: \$${item['price']}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total: \$${total.toStringAsFixed(2)}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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

class SaleReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sale Report'),
      ),
      body: DataTable(
        columns: [
          DataColumn(label: Text('Bill No')),
          DataColumn(label: Text('Payment Method')),
          DataColumn(label: Text('Total')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('1001')),
            DataCell(Text('Cash')),
            DataCell(Text('\$150.00')),
          ]),
          DataRow(cells: [
            DataCell(Text('1002')),
            DataCell(Text('Card')),
            DataCell(Text('\$200.00')),
          ]),
        ],
      ),
    );
  }
}

class ReturnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Return Items'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Enter Bill No',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Search bill logic here
              },
              child: Text('Search'),
            ),
          ),
        ],
      ),
    );
  }
}

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
            trailing: Text('Price: \$${product['price']}'),
          );
        },
      ),
    );
  }
}
