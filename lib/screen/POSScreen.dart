import 'package:flutter/material.dart';

// Step 01 First i make StatefulWidget which name is "POSScreen"
class POSScreen extends StatefulWidget {
  const POSScreen({super.key});

  @override
  State<POSScreen> createState() => _POSScreenState();
}


class _POSScreenState extends State<POSScreen> {

//step 06 we make List in list add Map which meaning we
  List<Map<String, dynamic>> cartItems = [];
  double total = 0;
  void addItemToCart(String name , String barcode , double price){
    setState(() {
      cartItems.add({'name': name, 'barcode': barcode, 'price': price});
      total += price;
    });
  }
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
         onSubmitted: (value){
           addItemToCart('D&G ', '12345', 50);
           // it's a dymmy data
         },
       ),
//step 06 i add listview bilder with help me to display data
       Expanded(child: ListView.builder(itemCount: cartItems.length,
       itemBuilder: (context, index) {
         var item = cartItems[index];
         return ListTile(
           title: Text(item['name']),
           subtitle: Text('Barcode: ${item['barcode']}'),
           trailing: Text('PKR:${item['price']}'),
           );
       },)
       ),
       Padding(padding: EdgeInsets.all(8.0),
       child: Text('Total amount PKR:${total.toStringAsFixed(2)}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)),

     ],
   ),
    );
  }
}
