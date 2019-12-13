
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:http/http.dart' as http;


class MealPlan extends StatefulWidget {
  int id;
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
            MealPlanTab(),
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
  @override
  _MealPlanTabState createState() => _MealPlanTabState();
}

class _MealPlanTabState extends State<MealPlanTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[

        MealPlanList(title: 'dfhjdh',description: 'dfjkd',),

      ],
    );
  }
}





class MealPlanList extends StatelessWidget {
  final String title;
  final String description;

  MealPlanList({this.title,this.description});
  @override
  Widget build(BuildContext context) {
    return
      Padding(
          padding: EdgeInsets.only(left: 12,right: 12),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/foodMeal.jpg"),
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
                              FittedBox(fit:BoxFit.contain,child: Text(this.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),
                              Text('Workout & Meal Plan',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),

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



void getWeeklyMealPlan() async{
  try{

   URL urldomain = URL();
    var url=urldomain.domain+"fetch_meal_plan";
    final response =await http.get(url);
    print('Response body:${response.body}');

  }catch(e){
      print('Error ouccured $e');
  }
}





