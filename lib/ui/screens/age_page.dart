import 'package:flutter/material.dart';
import 'package:real_bodies/theme/my_flutter_app_icons.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/category_item.dart';
import 'package:real_bodies/ui/widgets/info_text_field.dart';
 
 class AgePage extends StatefulWidget {
   final  PageController pageController;
   String goal="";
   String gender="";
   AgePage({this.pageController,this.goal,this.gender});

   @override
   _AgePageState createState() => _AgePageState();
 }
 
 class _AgePageState extends State<AgePage> {
   TextEditingController _infooldcontroller = new TextEditingController();
   @override
   Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
     return  Container(
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
                         "How old are you??",
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
                          "Select one",
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
            child: FittedBox(
              fit: BoxFit.contain,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


                     InfoTextField(
                      pageController: widget.pageController,
                      pagename: "old",
                      postfix: " ",
                      controller: _infooldcontroller,
                      goal: widget.goal,
                      gender: widget.gender,
                      
                    ),

                ],
              ),
            ),
          ),
        )
                  ),
                )
              ],
            ),

     );
   }
 }