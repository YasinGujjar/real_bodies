import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
 
 class GoalPage extends StatefulWidget {
 //  final void Function(int) onAddButtonTapped;
  final  PageController pageController;

  GoalPage({this.pageController});




   @override
   _GoalPageState createState() => _GoalPageState();
 }
 
 class _GoalPageState extends State<GoalPage> {
   @override
   Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
     return Container(
          color: Palette.mainPurple,
          child: ListView(
            children: <Widget>[
              Container(
                height: height * 0.35,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Icon(
                        Icons.fitness_center,
                        size: 125.0,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, right: 15.0, left: 15.0),
                      child: Text(
                        "What's your gaol?",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Select one",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.blueGrey,
                height: height * 0.45,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  elevation: 10.0,
                  child: new InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
                      print("tapped");
                      widget.pageController.animateToPage(1, duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);

                    },
                    child: Container(
                      child: ListTile(
                        title: Text(
                          '     Lose Weight',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text('       Burn fat & get lean'),
                        /* leading:
                        const Icon(Icons.), */
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  elevation: 10.0,
                  child: new InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
                      print("tapped");
                      widget.pageController.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);

                    },
                    child: Container(
                      child: ListTile(
                        title: Text(
                          '     Get Fitter',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text('       Tone up & feel healthy'),
                        /* leading:
                        const Icon(Icons.), */
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  elevation: 10.0,
                  child: new InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
                      print("tapped");
                      widget.pageController.animateToPage(1, duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);

                    },
                    child: Container(
                      child: ListTile(
                        title: Text(
                          '     Gain Muscle',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text('       Build mass & Strenght'),
                        /* leading:
                        const Icon(Icons.), */
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
                ),
              )
            ],
          ),
        );
   }
 }