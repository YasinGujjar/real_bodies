import 'package:flutter/material.dart';
import 'package:real_bodies/models/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:real_bodies/models/walkthrough.dart';
import 'package:real_bodies/pages/daily_workout_plan.dart';
import 'package:real_bodies/realbodyui/fitnesslevel.dart';
import 'package:real_bodies/realbodyui/fitnesslevel2.dart';
import 'package:real_bodies/realbodyui/fitnesslevel3.dart';
import 'package:real_bodies/realbodyui/register1.dart';

import 'package:real_bodies/realbodyui/signin.dart';
import 'package:real_bodies/realbodyui/step1.dart';
import 'package:real_bodies/realbodyui/step3.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // is not restarted.
        primarySwatch: Colors.blue,
       // canvasColor: Colors.transparent,
      ),
      home: FitnessLevelThree(),//MyHomePage(title: 'Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
 // MyHomePage({Key key, this.title}) : super(key: key);
  // always marked "final".

  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

 Future<Null> checkIsLogin() async {
    String _token = "";
    String _email = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString("password");
    _email = prefs.getString("name");
    print(_token);
    print(_email);
    if (_token != "" && _token != null) {
      print("alreay login.");
      startlogin(_email, _token);
    }
    else
    {
      //replace it with the login page
       Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => new Signin()),
      ); 
      
    }
    
  }


 void  startlogin(String _name, String _password) async
{
  URL urldomain = URL();
  
  var url=urldomain.domain+"login";
    final response=await http.get(url+"&email="+_name+"&password="+_password);

print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');
var jsonResponse = json.decode(response.body);

 var requestresponse=jsonResponse['response'];


if (requestresponse=="success")
{
 // var image=urldomain.imgdomain.toString()+jsonResponse['image'];
  var name=jsonResponse['name'];
  var id =jsonResponse['id'];
  // var gender=jsonResponse['gender'];
   // var old=jsonResponse['old'];
     //var height=jsonResponse['height'];
      //var weight=jsonResponse['weight'];
  // Navigator.of(context).pushReplacementNamed('/home');

   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StepOne( )),);
}
else if(requestresponse=="error")
{
 Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => new Signin()),
      ); 

  print("error login");
} 
  }
 
  
@override
 void initState() {
    // TODO: implement initState
    super.initState();
    checkIsLogin();
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
       body: Center(child: CircularProgressIndicator()),
    );
  }
}
