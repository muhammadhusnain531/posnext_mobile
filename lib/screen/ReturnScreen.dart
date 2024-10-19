import 'package:flutter/material.dart';

class ReturnScreen extends StatelessWidget {
  const ReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sale Return'),),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          TextField(
            decoration: InputDecoration(label: Text('Enter Bill No'),
                border: OutlineInputBorder(borderRadius:BorderRadius.circular(30.0))),
          ),
          Padding(padding: EdgeInsets.all(10))
          ,ElevatedButton(onPressed: (){}, child: Text('Search'))
        ],
      ),
    );
  }
}
