import 'package:charts_flutter/flutter.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/realbodyui/signin.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class registers extends StatefulWidget {
  @override
  _registersState createState() => _registersState();
}

class _registersState extends State<registers> {
  final TextEditingController _fullname = new TextEditingController();
final TextEditingController _email = new TextEditingController();
final TextEditingController _password = new TextEditingController();
final TextEditingController _confirmpassword = new TextEditingController();
  CustomTextField _nameField;
  CustomTextField _emailField;
  CustomTextField _passwordField;
  CustomTextField _confirmPasswordField;
  bool _blackVisible = false;
  VoidCallback onBackPress;
  URL urldomain=URL();

 void addinfo() async
  {
   try
   {
     var url=urldomain.domain+"registration";
    final response=await http.get(url+"&name="+_fullname.text+"&email="+_email.text+"&password="+_password.text);
    print('Response body:${response.body}');
   // var jsonResponse=json.decode(response.body);
  // print("jjjjjjjjj "+widget.goal+" ffffffff "+widget.gender+" jjjjjjjjjjjjjjj "+widget.age+" ffffffff "+widget.weight+" lolololo "+widget.height);
      if (response.body=="success")
      {
         Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) => Signin())); 
      }
       }
      catch(e)
      {
        print('Exception is on way $e');
      }
   
  }


  @override
  void initState() {
    super.initState();

    onBackPress = () {
      Navigator.of(context).pop();
    };
_nameField = new CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _fullname,
      hint: "Full Name",
      inputType: TextInputType.emailAddress,
      // validator: Validator.validateEmail,
    );
    _emailField = new CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _email,
      hint: "E-mail Adress",
      inputType: TextInputType.emailAddress,
      // validator: Validator.validateEmail,
    );
    _passwordField = CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _password,
      obscureText: true,
      hint: "Password",
      // validator: Validator.validatePassword,
    );
    _confirmPasswordField = CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _confirmpassword,
      obscureText: true,
      hint: "Confirm Password",
      // validator: Validator.validatePassword,
    );
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: true,
          centerTitle: true,
        title: Center(child: Text('Register')),
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
                  height: height*0.35,
                  //color: Colors.red,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                         Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                          child: _nameField,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                          child: _emailField,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                          child: _passwordField,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                          child: _confirmPasswordField,
                        )
                      ],
                    ),
                  ),
                ),Center(
                        child: Container(
                        height: height*0.40,
                          //color: Colors.yellow,
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/register1.png',scale: 6.0,),
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
                        onPressed: () {
                          if(_password.text==_confirmpassword.text)
                          {
                              addinfo();
                          }
                          else{
                            print("Paasword not matched");
                          }
                        },
                        color: Palette.buttonjColor,
                        textColor: Colors.white,
                        child: Text("Get started".toUpperCase(),
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
