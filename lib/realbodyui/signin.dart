import 'package:charts_flutter/flutter.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _fullname = new TextEditingController();
  CustomTextField _emailField;
  CustomTextField _passwordField;
  bool _blackVisible = false;
  VoidCallback onBackPress;

  @override
  void initState() {
    super.initState();

    onBackPress = () {
      Navigator.of(context).pop();
    };

    _emailField = new CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      //controller: _fullname,
      hint: "E-mail Adress",
      inputType: TextInputType.emailAddress,
      // validator: Validator.validateEmail,
    );
    _passwordField = CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      //controller: _password,
      obscureText: true,
      hint: "Password",
      // validator: Validator.validatePassword,
    );
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Sign In')),
        backgroundColor: Palette.mainPurple,

      ),
      backgroundColor: Color(0xffDE4922),
      body: Container(

        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: height*0.25,
                  //color: Colors.red,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                          child: _emailField,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                          child: _passwordField,
                        ),
                      ],
                    ),
                  ),
                ),Center(
                        child: Container(
                        height: height*0.50,
                          //color: Colors.yellow,
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/signin.png',scale: 4.5,),
                            ],
                          ),
                        ),
                      ),Center(
                  child: Container(
                    //margin: EdgeInsets.only(top: 5.0),
                      height: 50,
                      width: width * 0.80,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {},
                        color: Palette.buttonjColor,
                        textColor: Colors.white,
                        child: Text("Sign in".toUpperCase(),
                            style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
