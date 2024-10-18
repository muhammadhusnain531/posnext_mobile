import 'package:flutter/material.dart';

// Step 01 First i make StatefulWidget which name is "POSScreen"
class POSScreen extends StatefulWidget {
  const POSScreen({super.key});

  @override
  State<POSScreen> createState() => _POSScreenState();
}

class _POSScreenState extends State<POSScreen> {
  @override
  Widget build(BuildContext context) {

// Step 02 I Add Scaffold in scaffold add App Bar which name is "Point of sale"
    return Scaffold(
      appBar: AppBar(title: Text('POINT OF SALE',style: TextStyle(fontWeight: FontWeight.bold),),),
// Step 03 in scaffold body i add first column weidget
   body: Column(
     children: [
// step 04 add padding in all edge 8.0
       Padding(padding: EdgeInsets.all(8.0)),
// step 05 add TextFiled in text Filed user can enter Scan  or Enter product Name which want to buy custmer
       TextField(
         decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
             label: Text('Scan Barcode or Enter product Name ')),
       )
     ],
   ),
    );
  }
}
