import 'package:flutter/material.dart';
import 'package:posnext_mobile/screen/POSScreen.dart';
import 'package:posnext_mobile/screen/ProductListScreen.dart';
import 'package:posnext_mobile/screen/ReturnScreen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('POS NEXT Mobile'),
      ),
      drawer: Drawer(
        child:ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(child: Text('Menu',style: TextStyle(color: Colors.white),),
            decoration: BoxDecoration(color: Colors.blue),),
            ListTile(
              leading: Icon(Icons.point_of_sale),
              title: Text('POS'),
              onTap:  () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>POSScreen()));
              },
              
            ),
            ListTile(
              leading: Icon(Icons.receipt),
              title: Text('Sale Report'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>POSScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.autorenew),
              title: Text('Return'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReturnScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Product List'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductListScreen()));              },
            )
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to POS NEXT Mobile'),
      ),
    );
  }
}
