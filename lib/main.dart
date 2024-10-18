
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posnext_mobile/screen/MainMenuScreen.dart';
import 'package:posnext_mobile/screen/tt.dart';

void main(){
  runApp(POSNextApp());
}
class POSNextApp extends StatelessWidget {
  const POSNextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainMenuScreen(),
    );
  }
}
