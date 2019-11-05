import 'dart:core';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:real_bodies/business/auth.dart';
import 'package:real_bodies/business/validator.dart';
import 'package:real_bodies/models/user.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/screens/desktop.dart';
import 'package:real_bodies/ui/widgets/custom_alert_dialog.dart';
import 'package:real_bodies/ui/widgets/custom_flat_button.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullname = new TextEditingController();
  final TextEditingController _number = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  CustomTextField _nameField;
  CustomTextField _phoneField;
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

    _nameField = new CustomTextField(
      baseColor: Colors.grey,
       borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _fullname,
      hint: "Full Name",
      //validator: Validator.validateName,
    );
    _phoneField = new CustomTextField(
      baseColor: Colors.grey,
       borderColor: Colors.grey[400],
       //borderColor: Color(0xff3a0f9d),
      errorColor: Colors.red,
      controller: _number,
      hint: "Phone Number",
     // validator: Validator.validateNumber,
      inputType: TextInputType.number,
    );
    _emailField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _email,
      hint: "E-mail Adress",
      inputType: TextInputType.emailAddress,
     // validator: Validator.validateEmail,
    );
    _passwordField = CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _password,
      obscureText: true,
      hint: "Password",
     // validator: Validator.validatePassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        body: Container(
           decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage('assets/images/fit2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
          child: Stack(
            children: <Widget>[
              Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 70.0, bottom: 10.0, left: 10.0, right: 10.0),
                        child: Text(
                          "Create new account",
                          softWrap: true,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Palette.mainPurple,
                            decoration: TextDecoration.none,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                        child: _nameField,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                        child: _phoneField,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                        child: _emailField,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                        child: _passwordField,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 40.0),
                        child: CustomFlatButton(
                          title: "Sign Up",
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          textColor: Colors.white,
                          onPressed: () {
                            /* _signUp(
                                fullname: _fullname.text,
                                email: _email.text,
                                number: _number.text,
                                password: _password.text); */
                                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Desktop()),
  );
                          },
                          splashColor: Colors.black12,
                          borderColor: Palette.mainPurple,
                          borderWidth: 0,
                          color: Palette.mainPurple,
                        ),
                      ),
                    ],
                  ),
                  SafeArea(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: onBackPress,
                    ),
                  ),
                ],
              ),
              Offstage(
                offstage: !_blackVisible,
                child: GestureDetector(
                  onTap: () {},
                  child: AnimatedOpacity(
                    opacity: _blackVisible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.ease,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeBlackVisible() {
    setState(() {
      _blackVisible = !_blackVisible;
    });
  }

  /* void _signUp(
      {String fullname,
      String number,
      String email,
      String password,
      BuildContext context}) async {
    if (Validator.validateName(fullname) &&
        Validator.validateEmail(email) &&
        Validator.validateNumber(number) &&
        Validator.validatePassword(password)) {
      try {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        _changeBlackVisible();
        await Auth.signUp(email, password).then((uID) {
          Auth.addUser(new User(
              userID: uID,
              email: email,
              firstName: fullname,
              profilePictureURL: ''));
          onBackPress();
        });
      } catch (e) {
        print("Error in sign up: $e");
        String exception = Auth.getExceptionText(e);
        _showErrorAlert(
          title: "Signup failed",
          content: exception,
          onPressed: _changeBlackVisible,
        );
      }
    }
  } */

  /* void _showErrorAlert({String title, String content, VoidCallback onPressed}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          content: content,
          title: title,
          onPressed: onPressed,
        );
      },
    );
  } */
}
