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
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
                child: Center(child: Text(title, style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),),),

            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width ,


                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.elliptical(70,40),topRight: Radius.elliptical(70,40)),

                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 17.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                      child: Text('Excercises',style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),),
                ),
              ),
            )
          ],
        ),

    ),
    ),

// SizedBox(height: 200,),
 Positioned(
          top: expandedHeight * 0.97,//(expandedHeight - shrinkOffset)  ,
         // left: MediaQuery.of(context).size.width / 4,
//          child: Opacity(
//            opacity: ((shrinkOffset >40)? 0 :1 - (shrinkOffset   / expandedHeight)  ),

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
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 2.5,
          width: MediaQuery.of(context).size.width * 0.95,
          color: Palette.mainPurple,
        ),
      ),

    ),


       // ),
        ),

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
  double get minExtent => 80;

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
                color:  Palette.mainPurple,

                  child: Container(
                    //color: Colors.black,

                    decoration: BoxDecoration(

                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.elliptical(70,40),topRight: Radius.elliptical(70,40)),

                    ),


                  ),

              ),



//
            Positioned(
              top: (expandedHeight - shrinkOffset) ,// * 0.89  ,
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

 SizedBox(height: 200,),

             Container(
               height: 20,
              //color: Colors.black,
              decoration: BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.elliptical(70,40),topRight: Radius.elliptical(70,40)),

              ),
            ),

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
