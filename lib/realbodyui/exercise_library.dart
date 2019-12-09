import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class ExerciseLibrary extends StatefulWidget {
  @override
  _ExerciseLibraryState createState() => _ExerciseLibraryState();
}

class _ExerciseLibraryState extends State<ExerciseLibrary> {
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
              title: Center(child: Text('Exercise Library'),),

            bottom: ColoredTabBar(
              color: Colors.white,
              tabBar: TabBar(
                    unselectedLabelColor: Colors.grey,
                tabs: <Widget>[
                  Tab(text: 'Full Body',),
                  Tab(text: 'Arm',),
                  Tab(text: 'Foot',),
                  Tab(text: 'body',),
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
          body:TabBarView(children: [

          ],),
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


class ExerciseVideoList extends StatefulWidget {
  @override
  _ExerciseVideoListState createState() => _ExerciseVideoListState();
}

class _ExerciseVideoListState extends State<ExerciseVideoList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[

      ],
    );
  }
}

