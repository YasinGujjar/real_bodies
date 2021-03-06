import "package:flutter/material.dart";
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/services.dart';
import 'package:real_bodies/business/auth.dart';
import 'package:real_bodies/business/validator.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/models/user.dart';
import 'package:real_bodies/theme/palette.dart';
//import 'package:real_bodies/ui/screens/add_food.dart';
import 'package:real_bodies/ui/screens/addfood.dart';
import 'package:real_bodies/ui/screens/desktop.dart';
import 'package:real_bodies/ui/widgets/custom_alert_dialog.dart';
import 'package:real_bodies/ui/widgets/custom_flat_button.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignInScreen extends StatefulWidget {
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  CustomTextField _emailField;
  CustomTextField _passwordField;
  bool _blackVisible = false;
  VoidCallback onBackPress;
  URL urldomain =URL();

  @override
  void initState() {
    super.initState();

    onBackPress = () {
      Navigator.of(context).pop();
    };

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
   void checkinfo() async
  {
   try
   {
      
       var url=urldomain.domain+"login";
    final response=await http.get(url+"&email="+_email.text+"&password="+_password.text);
    print('Response body:${response.body}');
   var jsonResponse=json.decode(response.body);
  // print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj"+_fullname.text);
//print(url+"&f_name+="+_fullname.text+"&phone+="+_number.text+"&email+="+_email.text+"&password+="+_password.text);
     
      var requestresponse=jsonResponse['response'];
     // var name=jsonResponse['name'];
    
      if (requestresponse=="success")
{
 var image=urldomain.imgdomain.toString()+jsonResponse['image'];
  var name=jsonResponse['name'];
   var gender=jsonResponse['gender'];
    var old=jsonResponse['old'];
     var height=jsonResponse['height'];
      var weight=jsonResponse['weight'];

 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Desktop(image:image,name:name,gender:gender,old:old,height:height,weight:weight )),
  );
  }
else if(requestresponse=="error")
{

  print("error login");
} 


   }
   catch(e)
   {
     print("Exception on way $e");
   }
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
                          "Sign In",
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
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 10.0, left: 15.0, right: 15.0),
                        child: _emailField,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 20.0, left: 15.0, right: 15.0),
                        child: _passwordField,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 40.0),
                        child: CustomFlatButton(
                          title: "Log In",
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          textColor: Colors.white,
                          onPressed: () {
                            /* _emailLogin(
                                email: _email.text,
                                password: _password.text,
                                context: context);
                                 */   
                                checkinfo();
                                
                                                     },
                          splashColor: Colors.black12,
                          borderColor: Palette.mainPurple,
                          borderWidth: 0,
                          color: Palette.mainPurple,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "OR",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
            /*           Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 40.0),
                        child: CustomFlatButton(
                          title: "Facebook Login",
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          textColor: Colors.white,
                          onPressed: () {
                           // _facebookLogin(context: context);
                            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddNewFood()),
  );
                          },
                          splashColor: Colors.black12,
                          borderColor: Color.fromRGBO(59, 89, 152, 1.0),
                          borderWidth: 0,
                          color: Color.fromRGBO(59, 89, 152, 1.0),
                        ),
                      ), */
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 40.0),
                        child: CustomFlatButton(
                          title: "Gmail Login",
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          textColor: Colors.white,
                          onPressed: () {
                           // _facebookLogin(context: context);
                           /* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddFood()),
  ); */
                           
                          },
                          splashColor: Colors.black12,
                          borderColor: Color.fromRGBO(212, 70, 56, 1.0),
                          borderWidth: 0,
                          color: Color.fromRGBO(212, 70, 56, 1.0),
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

  /* void _emailLogin(
      {String email, String password, BuildContext context}) async {
    if (Validator.validateEmail(email) &&
        Validator.validatePassword(password)) {
      try {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        _changeBlackVisible();
        await Auth.signIn(email, password)
            .then((uid) => Navigator.of(context).pop());
      } catch (e) {
        print("Error in email sign in: $e");
        String exception = Auth.getExceptionText(e);
        _showErrorAlert(
          title: "Login failed",
          content: exception,
          onPressed: _changeBlackVisible,
        );
      }
    }
  }

  void _facebookLogin({BuildContext context}) async {
    try {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      _changeBlackVisible();
      FacebookLogin facebookLogin = new FacebookLogin();
      FacebookLoginResult result = await facebookLogin
          .logInWithReadPermissions(['email', 'public_profile']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          Auth.signInWithFacebok(result.accessToken.token).then((uid) {
            Auth.getCurrentFirebaseUser().then((firebaseUser) {
              User user = new User(
                firstName: firebaseUser.displayName,
                userID: firebaseUser.uid,
                email: firebaseUser.email ?? '',
                profilePictureURL: firebaseUser.photoUrl ?? '',
              );
              Auth.addUser(user);
              Navigator.of(context).pop();
            });
          });
          break;
        case FacebookLoginStatus.cancelledByUser:
        case FacebookLoginStatus.error:
          _changeBlackVisible();
      }
    } catch (e) {
      print("Error in facebook sign in: $e");
      String exception = Auth.getExceptionText(e);
      _showErrorAlert(
        title: "Login failed",
        content: exception,
        onPressed: _changeBlackVisible,
      );
    }
  }

  void _showErrorAlert({String title, String content, VoidCallback onPressed}) {
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
  }*/
}
 