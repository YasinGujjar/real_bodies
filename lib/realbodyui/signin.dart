import 'package:flutter/material.dart';
import 'package:real_bodies/business/validator.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/pages/fitness_goal.dart';
import 'package:real_bodies/realbodyui/bmi_creen.dart';
import 'package:real_bodies/realbodyui/dashboard.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_alert_dialog.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:real_bodies/ui/widgets/loading_dialogue.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
   String _name="";
  String _pass="";
  String argName = "";
  String argPassword="";
  String argUserName="";
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  CustomTextField _emailField;
  CustomTextField _passwordField;
  bool _blackVisible = false;
  VoidCallback onBackPress;
URL urldomain =URL();
 void checkinfo() async
  {
   try
   {
      
       var url=urldomain.domain+"login";
    final response=await http.get(url+"&email="+_email.text+"&password="+_password.text);
    print('Response body:${response.body}');
   var jsonResponse=json.decode(response.body);

//print(url+"&f_name+="+_fullname.text+"&phone+="+_number.text+"&email+="+_email.text+"&password+="+_password.text);
     
      var requestresponse=jsonResponse['response'];
       
      if (requestresponse=="success")
{
// var image=urldomain.imgdomain.toString()+jsonResponse['image'];
  var name=jsonResponse['name'];
   var calorie=jsonResponse['calories'];
    var weight=jsonResponse['weight'];
  int id= int.parse(jsonResponse['id']);
  print('commited');
  
  print('This is the idddddd   heloo$id');
 argName=_email.text;
                    argPassword=_password.text;
                   argUserName=name;
                    print("name:"+argName+" Password:"+argPassword+"userName:"+argUserName);
                    saveNamePreference(argName,argPassword,argUserName);


 Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => DashBoard(id: id,name: name,weight:weight,calorie:calorie,indexnumber: 0,)),
  );

/* 
 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Desktop(image:image,name:name,gender:gender,old:old,height:height,weight:weight )),
  ); */
  }
else if(requestresponse=="error")
{
   Navigator.of(context).pop();
 showDialog(context: context,
builder: (BuildContext context) {
  return CustomAlertDialog(title: "Alert!",content: "Invalid Email and Password",);
});
  print("error login");
} 


   }
   catch(e)
   {
     print("Exception on way $e");
   }
  }


  @override
  void initState() {
    super.initState();
loadNamePreference().then(updateValue) ;
    loadPasswordPreference().then(updateValue2);
     
    onBackPress = () {
      Navigator.of(context).pop();
    };

    _emailField = new CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _email,
      hint: "E-mail Adress",
      inputType: TextInputType.emailAddress,
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
  }
  Widget build(BuildContext context) {
     print(_name);
    print(_pass);
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
                        onPressed: () {
                          if(_email.text!="" && _password.text!="")
                           {
                             if(Validator.validateEmail(_email.text))
                             {
                               showDialog(context: context,
builder: (BuildContext context) {
  return LoadingDialogue();
});
                             checkinfo();
                              print(_name); 
                              print(_password);
                             }
                             else{
                                showDialog(context: context,
builder: (BuildContext context) {
  return CustomAlertDialog(title: "Alert!",content: "Email Invalid",);
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
  void updateValue(String name) {

    setState(() {
      if(name.toString().isNotEmpty ) {
        this._name = name;
        print("yes");
      }
      else
        print('error1');
    });
  }
   void updateValue2(String password) {

    setState(() {
      if(password.toString().isNotEmpty) {
        this._pass = password;
        
      }
      else
        print('error2');
    });
  }
  

}

Future<bool> saveNamePreference(String name, String password ,String userName) async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('name', name);
 pref.setString('password', password);
   pref.setString('userName', userName);

  return true;
}

Future<String> loadNamePreference() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  String name = pref.getString('name');
  return name;
}
Future<String> loadPasswordPreference() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  String password = pref.getString('password');
  return password;
}

/* Future<bool> showReview(context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          
                        child:Row(
                          children: <Widget>[
                            Container(
                              height: 100,
                              width: 100,
                              child: Center(child: CircularProgressIndicator())),
                              SizedBox(width: 12,),
                              Text("Loading...",style: TextStyle(fontWeight: FontWeight.w600),)
                          ],
                        ),
                
                );
      });
}
 */