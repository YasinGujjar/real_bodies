import 'package:flutter/material.dart';
import 'package:real_bodies/models/walkthrough.dart';
import 'package:real_bodies/pages/daily_workout_plan.dart';
import 'package:real_bodies/pages/exercise.dart';
import 'package:real_bodies/pages/exercise_details.dart';
import 'package:real_bodies/pages/food_details.dart';
import 'package:real_bodies/pages/food_diary_today.dart';
import 'package:real_bodies/pages/search_food.dart';
import 'package:real_bodies/pages/starting_pages.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/screens/desktop.dart';
import 'package:real_bodies/ui/screens/sign_in_screen.dart';
import 'package:real_bodies/ui/screens/start_page.dart';
import 'package:real_bodies/ui/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() {
   SharedPreferences.getInstance().then((prefs) {
    runApp(MyApp(prefs: prefs));
  });
} 

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  MyApp({this.prefs});
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
      home: _handleCurrentScreen(),//MyHomePage(title: 'Demo'),
    );
  }
  Widget _handleCurrentScreen() {
    bool seen = (prefs.getBool('seen') ?? false);
    if (seen) {
      return new WelcomeScreen();
    } else {
      return new StartingPages(prefs: prefs);
    }
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //heroTag: "btn",
        onPressed: (){

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Exercise()),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
}
