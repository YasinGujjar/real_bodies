import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class Program extends StatefulWidget {
  final id;
  Program(this.id);
  @override
  _ProgramState createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Palette.backGround,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 5,),
            Center(child: Text('Finalizing',style: TextStyle(color: Colors.white,fontSize: 20),)),
            SizedBox(height: 10,),
            Center(child: Text('Thank You, You have Done it. ',style: TextStyle(color: Colors.white,fontSize: 20),)),
            SizedBox(height: 10,),
            Text("We have all what we wanted. Now let's get a proper plan for you to start acting on your dream body ",style: TextStyle(color: Colors.white,fontSize: 15),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            SizedBox(height: 5,),
           ProgramList(title: '30 Days Summer',),

          ],
        ),
      ),
    );
  }
}

class ProgramList extends StatelessWidget {
  final String title;
  final String description;

  ProgramList({this.title,this.description});
  @override
  Widget build(BuildContext context) {
    return
      Padding(
          padding: EdgeInsets.only(left: 12,right: 12),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Color(0xff5847BA),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right:20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top:10.0,bottom: 8.0,left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Workout & Meal Plan',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),
                              FittedBox(fit:BoxFit.contain,child: Text(this.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),

                ],
                          ),
                          Text("Personalized summer plan, special to get back in shape",style: TextStyle(color: Colors.white,fontSize: 15),

                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 5,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: 70,
                                child: FlatButton(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () {},
                                  color: Palette.buttonjColor,
                                  textColor: Colors.white,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text("See More",
                                        style: TextStyle(fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Container(
                                height: 30,
                                width: 70,
                                child: FlatButton(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () {
                                    print(this.title);
                                  },
                                  color: Palette.buttonjColor,
                                  textColor: Colors.white,
                                  child: FittedBox(
                                    child: Text("Buy",
                                        style: TextStyle(fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex:1
                      ,child: Image.asset('assets/images/bodgoal4.png',fit: BoxFit.cover,)),
                ],
              ),
            ),
          )
      );
  }
}




