import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class MiddleSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MiddleSliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return
      Stack(
     // fit: StackFit.expand,
     // overflow: Overflow.visible,
      children: [

    Container(
      color: Colors.black,
      child: Container(
       //color: Colors.black,

      decoration: BoxDecoration(

      color: Palette.mainPurple,
        borderRadius: BorderRadius.only(topLeft: Radius.elliptical(70,40),topRight: Radius.elliptical(70,40)),

      ),

    ),
    ),
// SizedBox(height: 200,),
//
//           Container(
//             height: 20,
//            //color: Colors.black,
//            decoration: BoxDecoration(
//
//              color: Colors.white,
//              borderRadius: BorderRadius.only(topLeft: Radius.elliptical(70,40),topRight: Radius.elliptical(70,40)),
//
//            ),
//          ),

        ],
      );

  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class MiddleSecondSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MiddleSecondSliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return
      Stack(
        // fit: StackFit.expand,
        // overflow: Overflow.visible,
        children: [

          Container(
            color: Palette.mainPurple,
            child: Container(
              //color: Colors.black,

              decoration: BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.elliptical(70,40),topRight: Radius.elliptical(70,40)),

              ),

            ),
          ),
// SizedBox(height: 200,),
//
//           Container(
//             height: 20,
//            //color: Colors.black,
//            decoration: BoxDecoration(
//
//              color: Colors.white,
//              borderRadius: BorderRadius.only(topLeft: Radius.elliptical(70,40),topRight: Radius.elliptical(70,40)),
//
//            ),
//          ),

        ],
      );

  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 28;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
