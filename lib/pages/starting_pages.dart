import 'package:flutter/material.dart';
import 'package:real_bodies/theme/my_flutter_app_icons.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/screens/age_page.dart';
import 'package:real_bodies/ui/screens/gender_page.dart';
import 'package:real_bodies/ui/screens/goal_page.dart';
import 'package:real_bodies/ui/screens/height_page.dart';
import 'package:real_bodies/ui/screens/start_page.dart';
import 'package:real_bodies/ui/screens/weight_page.dart';
import 'package:real_bodies/ui/widgets/category_item.dart';

class StartingPages extends StatefulWidget {
  @override
  _StartingPagesState createState() => _StartingPagesState();
}

class _StartingPagesState extends State<StartingPages> {
  PageController pageController = PageController(initialPage: 0, keepPage: false);




  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView(
        physics:new NeverScrollableScrollPhysics(),
           controller: pageController,
        children: <Widget>[

          GoalPage(pageController: pageController,),
          GenderPage(pageController: pageController,),
          AgePage(pageController: pageController,),
          WeightPage(pageController: pageController,),
          HeightPage(pageController: pageController,),
          Starting(),

        ],
      ),
    );
  }
}


