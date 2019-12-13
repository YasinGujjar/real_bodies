import 'package:charts_flutter/flutter.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/realbodyui/signin.dart';
import 'package:real_bodies/realbodyui/step1.dart';
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
  int id;
  URL urldomain=URL();

 void addinfo() async
  {
   try
   {
     var url=urldomain.domain+"registration";
    final response=await http.get(url+"&name="+_fullname.text+"&email="+_email.text+"&password="+_password.text);
    print('Response body:${response.body}');
    var jsonResponse=json.decode(response.body);
  // print("jjjjjjjjj "+widget.goal+" ffffffff "+widget.gender+" jjjjjjjjjjjjjjj "+widget.age+" ffffffff "+widget.weight+" lolololo "+widget.height);
      var requestresponse = jsonResponse['response'];

      if (requestresponse == "success") {
        id= int.parse(jsonResponse['id']);
         Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) => StepOne(id:id))); 
      } else if (requestresponse == "error") {
        print("error");
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
     // inputType: TextInputType.emailAddress,
      colorfield: Palette.backGround,
      // validator: Validator.validateEmail,
    );
    _emailField = new CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _email,
      hint: "E-mail Adress",
      inputType: TextInputType.emailAddress,
      colorfield: Palette.backGround
      // validator: Validator.validateEmail,
    );
    _passwordField = CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _password,
      obscureText: true,
      hint: "Password",
      colorfield: Palette.backGround
      // validator: Validator.validatePassword,
    );
    _confirmPasswordField = CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _confirmpassword,
      obscureText: true,
      hint: "Confirm Password",
      colorfield: Palette.backGround
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
                         _nameField,
                        _emailField,
                        _passwordField,
                        _confirmPasswordField
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
                             /*  Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) => StepOne()));  */
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
