import 'package:flutter/material.dart';
import 'package:posnext_mobile/screen/POSScreen.dart';
import 'package:posnext_mobile/screen/bill_details_screen.dart';
import 'package:posnext_mobile/screen/bluetooth_screen.dart';
class SaleReportScreen extends StatelessWidget {
  final BluetoothPrintService printService = BluetoothPrintService();


  // Functions to calculate totals omitted for brevity

  // Function to calculate total cash sales
  double getTotalCashSales() {
  return salesReport
      .where((transaction) => transaction['paymentMethod'] == 'Cash')
      .fold(0.0, (sum, transaction) => sum + transaction['total']);
  }

  // Function to calculate total card sales
  double getTotalCardSales() {
  return salesReport
      .where((transaction) => transaction['paymentMethod'] == 'Card')
      .fold(0.0, (sum, transaction) => sum + transaction['total']);
  }

  // Function to calculate the grand total sales
  double getGrandTotalSales() {
  return getTotalCashSales() + getTotalCardSales();
  }



  @override
  Widget build(BuildContext context) {
  double totalCashSales = getTotalCashSales();
  double totalCardSales = getTotalCardSales();
  double grandTotalSales = getGrandTotalSales();

  return Scaffold(
      appBar: AppBar(
        title: Text('Sale Report'),
      ),
      body: Column(
        children: [
          SizedBox(height: 45),
          Expanded(
            child: salesReport.isEmpty
                ? Center(child: Text('No sales data available'))
                : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Bill No')),
                  DataColumn(label: Text('Payment Method')),
                  DataColumn(label: Text('Total')),
                  DataColumn(label: Text('Date')),
                ],
                rows: salesReport.map((transaction) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(transaction['billNo'], style: TextStyle(fontSize: 10)),
                        onTap: () {
                          // Navigate to BillDetailsScreen with the transaction details
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BillDetailsScreen(transaction: transaction),
                            ),
                          );
                        },
                      ),
                      DataCell(
                        Text(transaction['paymentMethod'], style: TextStyle(fontSize: 10)),
                        onTap: () async {
                          // Connect to the printer and print the bill
                          await printService.connectToPrinter();
                          await printService.printBill(transaction);
                        },
                      ),
                      DataCell(
                        Text('PKR ${transaction['total'].toStringAsFixed(2)}', style: TextStyle(fontSize: 10)),
                      ),
                      DataCell(
                        Text(transaction['date'], style: TextStyle(fontSize: 10)),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total Cash Sales: PKR ${totalCashSales.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'Total Card Sales: PKR ${totalCardSales.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Divider(), // A divider between totals and grand total
                Text(
                  'Grand Total Sales: PKR ${grandTotalSales.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
// SaleReportScreen update to show dynamic totals after returns
double getTotalCashSales() {
  return salesReport
      .where((transaction) => transaction['paymentMethod'] == 'Cash')
      .fold(0.0, (sum, transaction) => sum + transaction['total']);
}

double getTotalCardSales() {
  return salesReport
      .where((transaction) => transaction['paymentMethod'] == 'Card')
      .fold(0.0, (sum, transaction) => sum + transaction['total']);
}

//tr
