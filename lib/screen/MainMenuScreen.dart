import 'package:flutter/material.dart';
import 'package:posnext_mobile/screen/POSScreen.dart';
import 'package:posnext_mobile/screen/ProductListScreen.dart';
import 'package:posnext_mobile/screen/ReturnScreen.dart';
import 'package:posnext_mobile/screen/SaleReportScreen.dart';
// Step 01 i add StatelessWidget which name is MainMenuScreen

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
// Step 02 add Scaffold

    return Scaffold(
// step 03 add AppBar in appbar we added screen name "POS NEXT Mobile"
      appBar: AppBar(title: Text('POS NEXT Mobile'),
      ),
// step 04 add Drawer the Drawer was a side bar in side bar we can add many screen button like we can menu
      drawer: Drawer(
//step 05 in Drawer i added ListView which help to hold many view in single list
        child:ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
// step 06 in add header of Drawer we can add many tthing in Drawer header butt i only add name of Drawer"Menu" and  add color
            DrawerHeader(child: Text('Menu',style: TextStyle(color: Colors.white),),
            decoration: BoxDecoration(color: Colors.blue),),
//step 07 in Drawer in i add listtile which help me to make option
            ListTile(
// step 08 i add icon(leading) and name(title) and ontap option which help me to change screen
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SaleReportScreen()));
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
//comm