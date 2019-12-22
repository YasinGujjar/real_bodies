import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:video_player/video_player.dart';

class ExerciseLibrary extends StatefulWidget {
  @override
  _ExerciseLibraryState createState() => _ExerciseLibraryState();
}

class _ExerciseLibraryState extends State<ExerciseLibrary> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: DefaultTabController(
        length: 4,
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
            ExerciseVideoList(),
            Container(child:Center(child: Text('Coming Soon'))),
            Container(child:Center(child: Text('Coming Soon'))),
            Container(child:Center(child: Text('Coming Soon'))),

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
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _controller = VideoPlayerController.network('http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
    ..initialize().then((_) {
      setState(() {

      });
    } );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      child: ListView(
        children: <Widget>[



      Center(
        child: _controller.value.initialized
        ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(
          child: Column(
            children: <Widget>[
              Text('Please wait Video is loading'),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
          Center(child: Container(child:Text('Library Coming Soon'))),


          FloatingActionButton(onPressed: (){
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },

            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),


        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

}







