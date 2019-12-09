import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class CompletePlanInfo extends StatelessWidget {
  final String title;
  final String description;
  CompletePlanInfo({this.title,this.description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Palette.mainPurple,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Center(child: Text('$title',style: TextStyle(fontSize: 20),),)
      ),
      body: Container(
        color: Palette.backGround,
        child: ListView(
           children: <Widget>[
             SizedBox(height: 30,),
             ProgramList(title: 'Dala Dala',description: 'yes and yes',price: "\$900",),
             SizedBox(height: 30,),
             Center(child: Text('About This Plan',style: TextStyle(color: Colors.white),),),
             SizedBox(height: 30,),

           ],
        ),
      ),
    );

  }
}



class ProgramList extends StatelessWidget {
  final String title;
  final String description;
  final String price;

  ProgramList({this.title,this.description,this.price});
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
                              Text('Workout & Meal Plan',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            //  FittedBox(fit:BoxFit.contain,child: Text(this.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),

                            ],
                          ),
                          Text("$description",style: TextStyle(color: Colors.white,fontSize: 15),

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
                                    child: Text("Buy",
                                        style: TextStyle(fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16,),
                               Text('$price',style: TextStyle(color: Colors.white,fontSize: 18),),
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
