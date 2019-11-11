import 'package:flutter/material.dart';
import 'package:real_bodies/theme/my_flutter_app_icons.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/category_item.dart';
import 'package:real_bodies/ui/widgets/info_text_field.dart';
 
 class HeightPage extends StatefulWidget {
   @override
   _HeightPageState createState() => _HeightPageState();
 }
 
 class _HeightPageState extends State<HeightPage> {
  
  TextEditingController _infoftcontroller = new TextEditingController();
 TextEditingController _infoincontroller = new TextEditingController();
   @override
   Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
     return Scaffold(
            body: Container(
            color: Palette.mainPurple,
            child: ListView(
              children: <Widget>[
                Container(
                  height: height * 0.35,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Icon(
                          Icons.person,
                          size: 125.0,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 15.0, left: 15.0),
                        child: Text(
                         "How tall are you?",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "In Ft.",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.blueGrey,
                  height: height * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
          child: Container(
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InfoTextField(
                  postfix: " Ft.",
                  controller: _infoftcontroller,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                ),
                InfoTextField(
                  postfix: " In.",
                  controller: _infoincontroller,
                )
              ],
            ),
          ),
        )
                  ),
                )
              ],
            ),
          ),
     );
   }
 }