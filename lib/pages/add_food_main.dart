import 'package:flutter/material.dart';
import 'package:real_bodies/pages/search_food.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/screens/addfood.dart';

class AddFoodMain extends StatefulWidget {
  @override
  _AddFoodMainState createState() => _AddFoodMainState();
}

class _AddFoodMainState extends State<AddFoodMain> with SingleTickerProviderStateMixin{
  TabController _tabController;
  int _currentTabIndex = 0;




  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.search), text: 'Search',),
    Tab(icon: Icon(Icons.fastfood), text: 'My Food',),

  ];

  @override
  void initState() {
super.initState();
//_tabController = TabController(
//  length: 2,
//  vsync: this,
//);
  }

  @override
  Widget build(BuildContext context) {

    final _kTabPages = <Widget>[
      SearchFood(),
      MyFood()
    ];

    final _kBottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search',),),
      BottomNavigationBarItem(icon: Icon(Icons.fastfood), title: Text('My Food',),),

    ];
    assert(_kTabPages.length == _kBottomNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottomNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          _currentTabIndex = index;
        });
      },
    );

    return Scaffold(
//      appBar: AppBar(title: Text('Add Food'),
//      backgroundColor: Palette.mainPurple,),
//      body: TabBarView(children: <Widget>[
//        SearchFood(),
//        MyFood(),
//      ],
//        controller: _tabController,
//      ),
//      bottomNavigationBar: Material(
//        color: Palette.mainPurple,
//        child: TabBar(tabs: _kTabs,
//        controller: _tabController,),
//      ),
    body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}


class MyFood extends StatefulWidget {
  @override
  _MyFoodState createState() => _MyFoodState();
}

class _MyFoodState extends State<MyFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton (
        heroTag: "Add new food",
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewFood()),
          );
        },
        backgroundColor: Palette.mainPurple,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),

    );
  }
}
