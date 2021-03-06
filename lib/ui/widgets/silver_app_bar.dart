import 'package:flutter/material.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [

        Image.asset(
          'assets/images/workout_list.jpg',
          fit: BoxFit.cover,

        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               Text(
                "Full Body Workout",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),

              ],
            ),
          ),
        ),
//        Positioned(
//          top: expandedHeight - shrinkOffset  ,
//         // left: MediaQuery.of(context).size.width / 4,
//          child: Opacity(
//            opacity: (1 - shrinkOffset / expandedHeight),
////            child: Card(
////              elevation: 10,
////              child: SizedBox(
////                height:  expandedHeight,
////                width:  MediaQuery.of(context).size.width / 2,
////                child: FlutterLogo(),
////              ),
//    child: Container(
//      height: 20,
//    width: MediaQuery.of(context).size.width ,
//    color: Colors.blue,
//    ),
//
//
//        ),
//        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
