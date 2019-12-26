import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top ;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Palette.shopAppBarColor,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text("Shop",style: TextStyle(color: Color(0xff221E3A)),)
      ),
      body: Container(child: Text('hello how are you'),),
    );
  }
}
