import "package:flutter/material.dart";
import 'package:real_bodies/theme/palette.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: new AppBar(
        backgroundColor: Palette.mainPurple,
        elevation: 9.0,
        //      iconTheme: new IconThemeData(color: Colors.blue), //set color of icon
        title: Text('User Profile'),
        centerTitle: true,
      ),
       body:
       ListView(
children: <Widget>[
             Column(
          children: <Widget>[
             Stack(
                      children: <Widget>[
                        Container(height: 220.0),
                        Container(
                          height: 170.0,
                          
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              ),
                              //color: Colors.blue,
                              image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.9), BlendMode.dstATop),
            image: AssetImage('assets/images/mountains.jpg'),
           fit: BoxFit.cover,
          ), ),
                        ),
                        Positioned(
                            top: 120.0,
                            left: 20.0,
                            
                            child: Container(
                              
                              height: 80.0,
                              width: 80.0,
                              decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(45.0),
                                  
                                 image: DecorationImage(
                                   image: ExactAssetImage('assets/images/fit2.jpg'),
      fit: BoxFit.cover,
                                 ) ),
                            ))
                      ],
                    ),
                     Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Card(
                  elevation: 10.0,
                 child: Container(
                     height: 70.0,
                    // color: Palette.greyBackground,
                        

                    ),
                  
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Card(
                  elevation: 10.0,
                 child: Container(
                     height: 300.0,
                    // color: Palette.greyBackground,
                        

                    ),
                  
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Card(
                  elevation: 10.0,
                 child: Container(
                     height: 200.0,
                    // color: Palette.greyBackground,
                        

                    ),
                  
                ),
              ),
          ]
             ),
]
),   
    );
  }
}


