import 'package:flutter/material.dart';
import 'package:real_bodies/theme/my_flutter_app_icons.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/category_item.dart';
 
 class GenderPage extends StatefulWidget {
   final  PageController pageController;
   GenderPage({this.pageController});

   @override
   _GenderPageState createState() => _GenderPageState();
 }
 
 class _GenderPageState extends State<GenderPage> {
   @override
   Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
     return Container(
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
                         "What's your gender?",
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
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  CategoryItem(
                    name: 'Male',
                    icon: MyFlutterApp.male,
                    onPressed: () {
                      widget.pageController.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);

                    },
                    color: Colors.white,
                    elevation: 20.0,
                    bgColor: Colors.white,
                    click: Colors.white,
                  ),
                  CategoryItem(
                    name: 'Female',
                    icon: MyFlutterApp.female,
                    onPressed: () {
                      print("Hoo gyaaaaa");
                      widget.pageController.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);

                    },
                    color: Colors.white,
                    elevation: 20.0,
                    bgColor: Colors.white,
                    click:Colors.white,
                  ),
                ],
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