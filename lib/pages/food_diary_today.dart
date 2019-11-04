import 'package:flutter/material.dart';

class FoodDiaryToday extends StatefulWidget {
  @override
  _FoodDiaryTodayState createState() => _FoodDiaryTodayState();
}

class _FoodDiaryTodayState extends State<FoodDiaryToday> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//        statusBarColor: Colors.green
//    ));
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                onPressed: ()=>{}),
            Text('Today', style: TextStyle(color: Colors.white),),
            IconButton(icon: Icon(Icons.arrow_forward_ios),
                color: Colors.white,
                onPressed: ()=>{}),
          ],
        )),
      ),
    body:
        Container()

    );
  }
}
