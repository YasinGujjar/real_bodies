import 'package:flutter/material.dart';


import 'package:real_bodies/theme/palette.dart';

class ExcerciseInformation extends StatefulWidget {
  @override
  _ExcerciseInformationState createState() => _ExcerciseInformationState();
}

class _ExcerciseInformationState extends State<ExcerciseInformation> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.10,
          ),
          Container(
            height: height * 0.05,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(' Exercise',
                style: TextStyle(color: Palette.mainPurple,fontWeight: FontWeight.bold),),
            ),
          ),
          Container(
            height: height * 0.10,
          ),
          Container(
            height: height * 0.30,
            width: width * 0.95,
//            decoration: BoxDecoration(
//                color: Palette.primaryColor,
//
//                borderRadius: BorderRadius.all(
//                  Radius.circular(10.0),
//                ),
//                boxShadow: <BoxShadow>[
//                  const BoxShadow(
//                    color: const Color(0xFF000000),
//                    offset: Offset.zero,
//                    blurRadius: 5.0,
//                    spreadRadius: 0.0,
//                  ),
//                ]),

            child: Center(
              //remove centre to fill and stretch the image
              // child: FittedBox(
              // fit: BoxFit.fill,
              child: Image.asset('assets/images/exercise.gif'),
              // ),
            ),
          ),
          Container(
            height: height * 0.01,
            width: width * 0.90,
          ),
          Container(
            height: height * 0.43,
            width: width * 0.70,


              child: Text(
                "This text is very very very very very very very very very very very very very very very very very very very very very very very very very long",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 5,
              ),

          )
        ],
      ),

    );
  }
}
