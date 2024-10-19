
import 'package:flutter/material.dart';

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
          DataRow(cells: [
            DataCell(Text('1003')),
            DataCell(Text('Card')),
            DataCell(Text('\PKR 200'))
          ])
        ],
      ),
    );
  }
}
