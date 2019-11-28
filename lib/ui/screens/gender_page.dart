import 'package:flutter/material.dart';
import 'package:real_bodies/theme/my_flutter_app_icons.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/screens/age_page.dart';
import 'package:real_bodies/ui/widgets/category_item.dart';
 
 class GenderPage extends StatefulWidget {
   final  PageController pageController;
   String goal="";
   GenderPage({this.pageController,this.goal});

   @override
   _GenderPageState createState() => _GenderPageState();
 }
 
 class _GenderPageState extends State<GenderPage> {
   String gender="";
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
                        setState(() {
                          gender="male";
                          
                        });
                      //  widget.pageController.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);
                         Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AgePage(goal:widget.goal,gender:gender))); 
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
                       // widget.pageController.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);
                          setState(() {
                          gender="female";
                        });
                      //  widget.pageController.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);
                         Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => AgePage(goal:widget.goal,gender:gender))); 
                     
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
            ),
     );

   }
 }