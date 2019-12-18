
import 'dart:convert';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/models/weekly_meal.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:http/http.dart' as http;


class MealPlan extends StatefulWidget {
  final int id;
  MealPlan({this.id});
  @override
  _MealPlanState createState() => _MealPlanState();
}

class _MealPlanState extends State<MealPlan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Palette.mainPurple,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Center(child: Text('Meal Plan'),),
                bottom: ColoredTabBar(
                  color: Colors.white,
                  tabBar: TabBar(
                    unselectedLabelColor: Colors.grey,
                    tabs: <Widget>[
                      Tab(text: 'Plan',),
                      Tab(text: 'Recipes',),
                    ],
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: new BubbleTabIndicator(
                      indicatorHeight: 25.0,
                      indicatorColor: Palette.mainPurple,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,

                    ),
                  ),
                ),
          ),
          body:
          TabBarView(children: [
            MealPlanTab(id:widget.id),
            MealPlanList(title: 'dfhjdh',description: 'dfjkd',),

          ],
          ),
        ),
      ),
    );
  }
}
class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar({this.color, this.tabBar});

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
    color: color,
    child: tabBar,
  );
}








class MealPlanTab extends StatefulWidget {
  final int id;
  MealPlanTab({this.id});
  @override
  _MealPlanTabState createState() => _MealPlanTabState();
}


class _MealPlanTabState extends State<MealPlanTab> {
  Future<List<WeeklyMealPlan>> weeklyMealPlanList;
  @override
  void initState() {
    super.initState();
   weeklyMealPlanList = getWeeklyMealPlan(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.only(left:18.0),
          child: Text('Healthy BreakFast',style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 20,),

        FutureBuilder<List<WeeklyMealPlan>>(
            future: weeklyMealPlanList,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index){
                      return
                      snapshot.data[index].type == 'Breakfast'?

                        Column(
                          children: <Widget>[
                            MealPlanList(title:snapshot.data[index].foodName, description: snapshot.data[index].type,image: "assets/images/foodMeal.jpg",
                            ),
                            SizedBox(height: 10),
                          ],
                        ) : Container();
                    }
                );
              }
              else{
                Center(child: CircularProgressIndicator());
              }
              return Center(child: CircularProgressIndicator());
            }
        ),

        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.only(left:18.0),
          child: Text('Healthy Lunch',style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 20,),

        FutureBuilder<List<WeeklyMealPlan>>(
            future: weeklyMealPlanList,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index){
                      return
                        snapshot.data[index].type == 'Lunch'?

                        Column(
                          children: <Widget>[
                            MealPlanList(title:snapshot.data[index].foodName, description: snapshot.data[index].type,image: "assets/images/lunch.jpg",
                            ),
                            SizedBox(height: 10),
                          ],
                        ) : Container();
                    }
                );
              }
              else{
                Center(child: CircularProgressIndicator());
              }
              return Center(child: CircularProgressIndicator());
            }
        ),
        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.only(left:18.0),
          child: Text('Healthy Dinner',style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 20,),

        FutureBuilder<List<WeeklyMealPlan>>(
            future: weeklyMealPlanList,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index){
                      return
                        snapshot.data[index].type == 'Dinner'?

                        Column(
                          children: <Widget>[
                            MealPlanList(title:snapshot.data[index].foodName, description: snapshot.data[index].type,image: "assets/images/dinner.jpg",
                            ),
                            SizedBox(height: 10),
                          ],
                        ) : Container();
                    }
                );
              }
              else{
                Center(child: CircularProgressIndicator());
              }
              return Center(child: CircularProgressIndicator());
            }
        ),
        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.only(left:18.0),
          child: Text('Healthy Snacks',style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 20,),

        FutureBuilder<List<WeeklyMealPlan>>(
            future: weeklyMealPlanList,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index){
                      return
                        snapshot.data[index].type == 'Snack1'?

                        Column(
                          children: <Widget>[
                            MealPlanList(title:snapshot.data[index].foodName, description: snapshot.data[index].type,
                               image: "assets/images/snacks.jpg"
                            ),
                            SizedBox(height: 10),
                          ],
                        ) : Container();
                    }
                );
              }
              else{
                Center(child: CircularProgressIndicator());
              }
              return Center(child: CircularProgressIndicator());
            }
        ),

      ],
    );
  }
}





class MealPlanList extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  MealPlanList({this.title,this.description,this.image});
  @override
  Widget build(BuildContext context) {
    return
      Padding(
          padding: EdgeInsets.only(left: 12,right: 12),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:

                AssetImage(image),
                fit: BoxFit.cover
              ),
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
                      padding: const EdgeInsets.only(top:20.0,bottom: 8.0,left: 8.0),
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
//                          Text("$description",style: TextStyle(color: Colors.white,fontSize: 15),
//
//                            overflow: TextOverflow.ellipsis,
//                            textAlign: TextAlign.center,
//                            maxLines: 5,
//                          ),

                          Container(
                            height: 40,
                            width: 90,
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
                                    style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex:1,
                    //child: Image.asset('assets/images/bodgoal4.png',fit: BoxFit.cover,)
                    child: SizedBox(height: 200,),
                     ),
                ],
              ),
            ),
          )
      );
  }
}



Future<List<WeeklyMealPlan>> getWeeklyMealPlan(int id) async{
  try{
    print(id);
   DateTime nowTime = DateTime.now();
   URL urldomain = URL();
    var url=urldomain.domain+"fetch_weekly_meal_plan";
    final response =await http.get(url+"&id=$id"+"&date=$nowTime");
    print(url+"&id=$id"+"&date=$nowTime");
    print('Response body:${response.body}');

    Iterable list = json.decode(response.body);

    List <WeeklyMealPlan> wmpl = list.map((model)=>WeeklyMealPlan.fromJson(model)).toList();


    return wmpl;
  //  wmpl.forEach((f)=>print(f.type));

  }catch(e){
      print('Error ouccured $e');
  }

}





