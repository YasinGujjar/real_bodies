import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class SearchFoodPage extends StatefulWidget {
  @override
  _SearchFoodPageState createState() => _SearchFoodPageState();
}

class _SearchFoodPageState extends State<SearchFoodPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Palette.mainPurple,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Center(child: Text('Search Add Food'),)
      ),
      body: ListView(
    children: <Widget> [
        Container(
          // color: Colors.blue,
          height: height * 0.04,
          width: width * 0.95,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Total Calories Aim Today",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "1600",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red
                    ),
                  )),
            ],
          ),
        ),
        Container(
          //  color: Colors.blue,
          height: height * 0.04,
          width: width * 0.95,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Food Calories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "1000",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ),
        Container(
          //  color: Colors.blue,
          height: height * 0.04,
          width: width * 0.95,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Exercise",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "-400",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ),
        Container(
          //  color: Colors.blue,
          height: height * 0.04,
          width: width * 0.95,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Remaining",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "600",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      ),
    );
  }
}
