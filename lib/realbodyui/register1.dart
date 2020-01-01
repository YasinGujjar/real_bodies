import 'package:charts_flutter/flutter.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:real_bodies/business/validator.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/realbodyui/signin.dart';
import 'package:real_bodies/realbodyui/step1.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_alert_dialog.dart';
import 'package:real_bodies/ui/widgets/custom_dialogues.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:real_bodies/ui/widgets/loading_dialogue.dart';


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
                .pushReplacement(MaterialPageRoute(builder: (context) => StepOne(id:id,name:_fullname.text,email:_email.text,password:_password.text))); 
      } else if (requestresponse == "error") {
         Navigator.of(context).pop();
        print("error");
         showDialog(context: context,
builder: (BuildContext context) {
  return CustomAlertDialog(title: "Alert!",content: "ERROR...Try Again",);
});
      }
      else if (requestresponse == "duplicate") {
         Navigator.of(context).pop();
        print("Already");
         showDialog(context: context,
builder: (BuildContext context) {

  return CustomAlertDialog(title: "Alert!",content: "This Email has Already Account",);

});
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
      textColor: Colors.white,
      inputType: TextInputType.text,
      colorfield: Palette.backGround,
      // validator: Validator.validateEmail,
    );
    _emailField = new CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _email,
      hint: "E-mail Adress",
     // inputType: TextInputType.emailAddress,
      colorfield: Palette.backGround,
      textColor: Colors.white,
      // validator: Validator.validateEmail,
    );
    _passwordField = CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _password,
      obscureText: true,
      hint: "Password",
      colorfield: Palette.backGround,
      textColor: Colors.white,
      // validator: Validator.validatePassword,
    );
    _confirmPasswordField = CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _confirmpassword,
      obscureText: true,
      hint: "Confirm Password",
      colorfield: Palette.backGround,
      textColor: Colors.white,
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
                          
                          if(_fullname.text!="" && _email.text!="" && _password.text!="" && _confirmpassword.text!="")
                          {
                            if(Validator.validateEmail(_email.text))
                            {
                               if(_password.text==_confirmpassword.text)
                          {
                             showDialog(context: context,
builder: (BuildContext context) {
  return LoadingDialogue();
});
                              addinfo();
                             print("next page");
                             /*  Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) => StepOne()));  */
                          }
                          else{
                            print("Paasword not matched");
                             showDialog(context: context,
builder: (BuildContext context) {
  return CustomAlertDialog(title: "Alert!",content: "Password not matched",);
});
                          }

                            }
                            else{
                              showDialog(context: context,
builder: (BuildContext context) {
  return CustomAlertDialog(title: "Alert!",content: "Email not Valid",);
});
                            }
                           
                        }
                        else
                        {
                         showDialog(context: context,
builder: (BuildContext context) {
  return CustomAlertDialog(title: "Alert!",content: "Must Fill the Fields",);
});
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
/*  void _signUp(
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
       // SystemChannels.textInput.invokeMethod('TextInput.hide');
       /*  _changeBlackVisible();
        await Auth.signUp(email, password).then((uID) {
          Auth.addUser(new User(
              userID: uID,
              email: email,
              firstName: fullname,
              profilePictureURL: ''));
          onBackPress();
        }); */
      } catch (e) {
        print("Error in sign up: $e");
       // String exception = Auth.getExceptionText(e);
     /*    _showErrorAlert(
          title: "Signup failed",
          content: exception,
          onPressed: _changeBlackVisible,
        ); */
      }
    }
  }
 */

}

/* Future<bool> showReview(context, String message) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
             // color: Colors.blue,
                height: 280.0,
                width: 200.0,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(height: 150.0),
                        Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              color: Palette.mainPurple,)
                        ),
                        Positioned(
                            top: 50.0,
                            left: 94.0,
                            child: Container(
                              height: 90.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45.0),
                                  border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 2.0),
                                 image: DecorationImage(
                                   image: ExactAssetImage('assets/images/sad.png'),
      fit: BoxFit.cover,
                                 ) ),
                            ))
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          message,
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                    SizedBox(height: 15.0),
                    FlatButton(
                      child: Center(
                        child: Text(
                          'OKAY',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              color: Colors.teal),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.transparent
                    )
                  ],
                )));
      });
}


 */