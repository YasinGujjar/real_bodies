import "package:flutter/material.dart";
import 'package:real_bodies/pages/daily_workout_plan.dart';
import 'package:real_bodies/pages/exercise.dart';
import 'package:real_bodies/pages/food_details.dart';
import 'package:real_bodies/pages/food_diary_today.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/screens/user_profile.dart';


class Desktop extends StatefulWidget {
   String image="";
  String name="";
  String height="";
  String weight="";
  String old="";
  String gender="";
  
  Desktop({@required this.image,@required this.name,@required this.height,@required this.weight,@required this.old,@required this.gender});
  @override
  _DesktopState createState() => _DesktopState();

}

class _DesktopState extends State<Desktop> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.fitness_center),
                Stack(
                  children: <Widget>[
                    Container(height: 60.0, width: 60.0),
                    InkWell(
                       splashColor: Colors.blue,
                       borderRadius: BorderRadius.circular(15.0),
                    onTap: () {
                      print("tapped");
                       Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UserProfile(image:widget.image,name:widget.name,gender:widget.gender,old:widget.old,height:widget.height,weight:widget.weight))); 
                    },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(widget.image) ,//AssetImage('assets/images/fit2.jpg'),
                          fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(25.0)
                        ),
                      ),
                    ),
                    Positioned(
                      left: 5.0,
                      top: 40.0,
                      child: Container(
                        height: 15.0,
                        width: 15.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.5),
                          color: Colors.green,
                          border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 1.0
                          )
                        ),
                      
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Action ',
                  style: TextStyle(
                      fontFamily: 'Opensans',
                      fontSize: 35.0,
                      color:Palette.mainPurple ),
                ),
                Text(
                  'is the foundational',
                  style: TextStyle(
                    fontFamily: 'Opensans',
                    fontSize: 35.0,
                  ),
                ),
                Text(
                  'key to all success',
                  style: TextStyle(
                    fontFamily: 'Opensans',
                    fontSize: 35.0,
                  ),
                )
              ],
            ),
          ),
         /*  Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: EdgeInsets.only(left: 20.0),
              height: 70.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFFF9F9F9)),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.withOpacity(0.7),
                    ),
                    hintText: 'What would you like to discover?',
                    hintStyle: TextStyle(
                        fontFamily: 'Opensans',
                        fontSize: 15.0,
                        color: Colors.grey.withOpacity(0.7)),
                  ),
                ),
              ),
            ),
          ), */
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Fitness Courses',
                      style: TextStyle(
                        fontFamily: 'Opensans',
                        fontSize: 20.0,
                      )),
                  Icon(Icons.more_horiz, color: Colors.black)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              height: 215.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildCard(
                      'Full Body', '4.1', 'assets/images/fit2.jpg','exercise'),
                  _buildCard(
                      'Biceps, Triceps', '3.8', 'assets/images/fit.jpg','workout'),
                       _buildCard(
                      'Flexibility Exercise', '3.8', 'assets/images/flex.jpg','exercise'),
                ],
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Food Diary',
                      style: TextStyle(
                        fontFamily: 'Opensans',
                        fontSize: 20.0,
                      )),
                  Icon(Icons.more_horiz, color: Colors.black)
                ],
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              height: 215.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildCard(
                      'Food Log', '4.1', 'assets/images/food3.jpg','food'),
                  _buildCard(
                      'Dieting Plan', '3.8', 'assets/images/food2.jpg','foodDetail'),
                       _buildCard(
                      'Nuterients Food', '3.8', 'assets/images/food.jpg','food'),
                ],
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Blog',
                      style: TextStyle(
                        fontFamily: 'Opensans',
                        fontSize: 20.0,
                      )),
                  Icon(Icons.more_horiz, color: Colors.black)
                ],
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              height: 240.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildCard(
                      'Full Body', '4.1', 'assets/images/blog.jpg','blog'),
                  _buildCard(
                      'Biceps, Triceps', '3.8', 'assets/images/blog2.jpg','blog'),
                       
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildCard(String title, String rating, String imgPath, String page) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            if (page=="exercise")
            {
               Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Exercise()));
             }
            if (page=="food")
            { Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FoodDiaryToday())); 
            }
            if (page=="blog")
            { /* Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Exercise()));  */
            } 
            if(page=="workout")
            {
               Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => DailyWorkOutPlan())); 
            }
            if(page=="foodDetail")
            {
               Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FoodDetails())); 
            }
          },
          child: Stack(
            children: <Widget>[
              Container(
                height: 215.0,
                width: 200.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.cover)),
              ),
              //make the shade a bit deeper.
              Container(
                height: 215.0,
                width: 200.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.black.withOpacity(0.4)),
              ),
              Positioned(
                top: 10.0,
                left: 10.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.black.withOpacity(0.2)),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.white, size: 12.0),
                          SizedBox(width: 5.0),
                          Text(
                            rating,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      'More',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Opensans'),
                    ),
                    SizedBox(width: 7.0),
                    //this should be an iconbutton in a real app.
                    Icon(Icons.arrow_drop_down, color: Colors.white, size: 25.0)
                  ],
                ),
              ),
              Positioned(
                top: 165.0,
                left: 10.0,
                child: Container(
                  width: 150.0,
                  child: Text(title,
                      style: TextStyle(
                          fontFamily: 'Opensans',
                          fontSize: 17.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
              ),
             
            ],
          ),
        ));
  }
}
