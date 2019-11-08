import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class MiddleSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String title;

  MiddleSliverAppBar({@required this.expandedHeight, this.title});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
   // overlapsContent = true;
    return
      Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,

      children: [

    Container(
      color: Colors.black,
      child: Container(
       //color: Colors.black,

      decoration: BoxDecoration(

      color: Palette.mainPurple,
        borderRadius: BorderRadius.only(topLeft: Radius.elliptical(70,40),topRight: Radius.elliptical(70,40)),

      ),
        child: Center(
          child: Text(title,style: TextStyle(
            color: Colors.white
          ),),
        ),

    ),
    ),

// SizedBox(height: 200,),
// Positioned(
//          top: (expandedHeight - shrinkOffset) * 0.85  ,
//         // left: MediaQuery.of(context).size.width / 4,
//          child: Opacity(
//            opacity: ((shrinkOffset >40)? 0 :1 - (shrinkOffset   / expandedHeight)  ),
//
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
//    color: Colors.white,
//    ),
//
//
//        ),
//        ),
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
    print('shrink offset $shrinkOffset');

    return
      Stack(
         fit: StackFit.expand,
        overflow: Overflow.visible,
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



          Positioned(
            top: (expandedHeight - shrinkOffset)  * 0.89  ,
            // left: MediaQuery.of(context).size.width / 4,
            child: Opacity(
              opacity: ((shrinkOffset >5)? 0 :1 - (shrinkOffset   / expandedHeight)  ),

//            child: Card(
//              elevation: 10,
//              child: SizedBox(
//                height:  expandedHeight,
//                width:  MediaQuery.of(context).size.width / 2,
//                child: FlutterLogo(),
//              ),
              child: Container(
                height: 10,
                width: MediaQuery.of(context).size.width ,
                color: Colors.white,
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
