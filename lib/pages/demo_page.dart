import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: Container(
      //  height: 200,
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: height * 0.32,
               // color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top:29.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Abc'),
                      Text('Abc'),

                    ],
                  ),
                ),
              ),
              Container(
                height: height * 0.32,
                color: Colors.blue,
                child: Center(child: Text('Hello')),
              ),
              Container(
                height: height * 0.34,
                color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Center(
                      child:  Container(
                        height: 50,
                        width: width * 0.80,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          onPressed: () {},
                          color: Palette.buttonjColor,
                          textColor: Colors.white,
                          child: Text("Start".toUpperCase(),
                              style: TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Center(
                      child:  Container(
                        height: 50,
                        width: width * 0.80,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          onPressed: () {},
                          color: Palette.buttonjColor,
                          textColor: Colors.white,
                          child: Text("Start".toUpperCase(),
                              style: TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),


                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
