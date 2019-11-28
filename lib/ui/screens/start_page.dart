import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/screens/welcome_screen.dart';
import 'package:real_bodies/ui/widgets/custom_flat_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Starting extends StatefulWidget {
    String goal="";
  String gender="";
  String age="";
  String height="";
  String weight="";
   final SharedPreferences prefs;
     Starting({this.prefs,this.goal,this.gender,this.age,this.weight,this.height});
  @override
  _StartingState createState() => _StartingState();
}

class _StartingState extends State<Starting> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Palette.mainPurple,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.get_app,
                size: 125.0,
                color: Colors.white,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 50.0, right: 15.0, left: 15.0),
                child: Text(
                  "Welcome to Fitness App",
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
                padding:
                    const EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0),
                child: CustomFlatButton(
                  title: "Get Started",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  onPressed: () {
                   //  widget.prefs.setBool('seen', true);
                    // Navigator.of(context).pushNamed("/root");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen(goal:widget.goal,gender:widget.gender,age:widget.age,weight:widget.weight,height:widget.height)),
                    );
                   
                  },
                  splashColor: Colors.black12,
                  borderColor: Colors.white,
                  borderWidth: 2,
                  color: Color.fromRGBO(58, 15, 157, 1.0),
                ),
              ),
            ],
          ),
        ),
      );
  }
}