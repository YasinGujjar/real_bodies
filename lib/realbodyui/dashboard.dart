import 'package:flutter/material.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/pages/search_food.dart';
import 'package:real_bodies/realbodyui/food_exercise_diary.dart';
import 'package:real_bodies/realbodyui/meal_plan.dart';
import 'package:real_bodies/realbodyui/search_add_food.dart';
import 'package:real_bodies/realbodyui/show_weight.dart';
import 'package:real_bodies/theme/my_flutter_app_icons.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashBoard extends StatefulWidget {
  final int id;
  final String name;
  final String weight;
  final String calorie;
  DashBoard({this.id,this.name,this.weight,this.calorie});
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  
  int _selectedIndex = 0;
List imgList=[];
List weightList=[];
 URL urldomain =URL();
 checkinfo() async
  {
   try
   {
      print("id weight"+widget.id.toString());
      print(DateTime.now().toString());
       var url=urldomain.domain+"get_weight_record";
    final response=await http.get(url+"&id="+widget.id.toString());
    print('Response body:${response.body}');
   var jsonResponse=json.decode(response.body);
 for(int i=0; i<jsonResponse.length; i++){
 imgList.add([URL.imageUrl+jsonResponse[i]['image'],jsonResponse[i]['date'] ,jsonResponse[i]['weight']]);
// weightList.add(jsonResponse[i]['weight']);

 }
print(imgList);
//return imgList;
   }
   catch(e)
   {
     print("Exception on way $e");
   }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkinfo();
  }

   @override
  Widget build(BuildContext context) {
    

    final _tabs = [
      storeTab(context,widget.name),
       SearchFood(),
      FoodExerciseDiary(id: widget.id,calorie:widget.calorie),
      Text('Tab4'),
      Text('Tab5'),
       ShowWeight(id:widget.id,weight:widget.weight,imgList: imgList,weightList:weightList)
    ];

    return Scaffold(
        backgroundColor: Palette.boldTextO,
      
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  'Home',
                
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.directions_run),
                title: Text(
                  'Training',
                  
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.developer_board),
                title: Text(
                  'Dairy',
                 
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.equalizer),
                title: Text(
                  'Progress',
                  
                )),
            BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.dinner),
                title: Text("Food"
                  
                )),
                 BottomNavigationBarItem(
                icon: Icon(Icons.shutter_speed),
                title: Text(
                  'Weight',
                
                )),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Palette.boldTextO,
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Widget storeTab(BuildContext context,String name) {
 double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
  // will pick it up from here
  // am to start another template
  
  return ListView(children: <Widget>[
    Container(
      width:width ,
      height:height* 0.22,
      //color: Colors.blue,
      child: Column(
        children: <Widget>[
          Center(child: Text("REAL BODIES",
          style: TextStyle(fontSize: 34.0,fontWeight: FontWeight.w700),)),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               
                Stack(
                  children: <Widget>[
                    Container(height: 60.0, width: 60.0),
                    InkWell(
                       splashColor: Colors.blue,
                       borderRadius: BorderRadius.circular(15.0),
                    onTap: () {
                      print("tapped");
                      /*  Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UserProfile(image:widget.image,name:widget.name,gender:widget.gender,old:widget.old,height:widget.height,weight:widget.weight))); 
                   */  },
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(image:AssetImage('assets/images/fit2.jpg'), //NetworkImage(widget.image) ,//
                          fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(30.0)
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
                ),
                FittedBox(
                  fit: BoxFit.contain,
                                  child: Text("  WELCOME "+name,
    style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w700,color: Colors.white),),
                )
              ],
            ),
          ),
        ],
      ),
    ),
    
          Container(
            height: height*0.70,
           // color: Colors.yellow,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                         color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
  side: BorderSide(
    color: Colors.white,
    width: 2.0,
  ),
),

                                          child: Container(

                        //  color: Colors.blue,
                          height: height*0.1,
                          width: width*0.2,
                           
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.home,color: Colors.white,),
                              Text(" "),
                              Text("Home",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                         color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
  side: BorderSide(
    color: Colors.white,
    width: 2.0,
  ),
),

                                          child: Container(

                        //  color: Colors.blue,
                          height: height*0.1,
                          width: width*0.2,
                           
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.shutter_speed,color: Colors.white,),
                              Text(" "),
                              Text("Weight",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                         color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
  side: BorderSide(
    color: Colors.white,
    width: 2.0,
  ),
),

                                          child: Container(

                        //  color: Colors.blue,
                          height: height*0.1,
                          width: width*0.2,
                           
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.list,color: Colors.white,),
                              Text(" "),
                              FittedBox(
                                fit: BoxFit.contain,
                                child: Text("Training Plan ",style: TextStyle(color: Colors.white),)
                                ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                         color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
  side: BorderSide(
    color: Colors.white,
    width: 2.0,
  ),
),

                                          child: Container(

                        //  color: Colors.blue,
                          height: height*0.1,
                          width: width*0.2,
                           
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.equalizer,color: Colors.white,),
                              Text(" "),
                              FittedBox(
                                fit: BoxFit.contain,
                                child: Text("Training Stats",style: TextStyle(color: Colors.white),)),
                            ],
                          ),
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                         color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
  side: BorderSide(
    color: Colors.white,
    width: 2.0,
  ),
),

                                          child: GestureDetector(
                                            onTap: (){
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(builder: (context) => MealPlan(id:2)));

                                            },
                                            child: Container(

                        //  color: Colors.blue,
                          height: height*0.1,
                          width: width*0.2,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(MyFlutterApp.free_breakfast,color: Colors.white,),
                              Text(" "),
                              Text("Meal Plan",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                                          ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                         color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
  side: BorderSide(
    color: Colors.white,
    width: 2.0,
  ),
),

                                          child: Container(

                        //  color: Colors.blue,
                          height: height*0.1,
                          width: width*0.2,
                           
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.calendar_today,color: Colors.white,),
                              Text(" "),
                              Text("Schedule",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                         color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
  side: BorderSide(
    color: Colors.white,
    width: 2.0,
  ),
),

                                          child: Container(

                        //  color: Colors.blue,
                          height: height*0.1,
                          width: width*0.2,
                           
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.local_grocery_store,color: Colors.white,),
                              Text(" "),
                              Text("Shop",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                         color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
  side: BorderSide(
    color: Colors.white,
    width: 2.0,
  ),
),

                                          child: Container(

                        //  color: Colors.blue,
                          height: height*0.1,
                          width: width*0.2,
                           
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.directions_walk,color: Colors.white,),
                              Text(" "),
                              Text("Exercise",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                         color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
  side: BorderSide(
    color: Colors.white,
    width: 2.0,
  ),
),

                                          child: Container(

                        //  color: Colors.blue,
                          height: height*0.1,
                          width: width*0.2,
                           
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.lightbulb_outline,color: Colors.white,),
                              Text(" "),
                              Text("Tips",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                         color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
  side: BorderSide(
    color: Colors.white,
    width: 2.0,
  ),
),

                                          child: Container(

                        //  color: Colors.blue,
                          height: height*0.1,
                          width: width*0.2,
                           
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.settings_applications,color: Colors.white,),
                              Text(" "),
                              Text("Setting",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                         color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
  side: BorderSide(
    color: Colors.white,
    width: 2.0,
  ),
),

                                          child: Container(

                        //  color: Colors.blue,
                          height: height*0.1,
                          width: width*0.2,
                           
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.not_listed_location,color: Colors.white,),
                              Text(" "),
                              Text("Supprot",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(

                        //  color: Colors.blue,
                          height: height*0.1,
                          width: width*0.2,
                           
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              /* Icon(Icons.home,color: Colors.white,),
                              Text(" "),
                              Text("Home",style: TextStyle(color: Colors.white),), */
                            ],
                          ),
                        ),
                    )
                  ],
                ),
              ],
            ),)
    
  ]);
}

/* Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          child: Text('View all ›', style: contrastText),
        ),
      )
    ],
  );
}
 */
// wrap the horizontal listview inside a sizedBox..
/* Widget headerTopCategories() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('All Categories', onViewMore: () {}),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            headerCategoryItem('Frieds', Fryo.dinner, onPressed: () {}),
            headerCategoryItem('Fast Food', Fryo.food, onPressed: () {}),
            headerCategoryItem('Creamery', Fryo.poop, onPressed: () {}),
            headerCategoryItem('Hot Drinks', Fryo.coffee_cup, onPressed: () {}),
            headerCategoryItem('Vegetables', Fryo.leaf, onPressed: () {}),
          ],
        ),
      )
    ],
  );
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 86,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
        Text(name + ' ›', style: categoryText)
      ],
    ),
  );
}

Widget deals(String dealTitle, {onViewMore, List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('No items available at this moment.',
                          style: taglineText),
                    )
                  ],
          ),
        )
      ],
    ),
  );
}
 */