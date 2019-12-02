import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/newcarousel.dart';
import 'package:real_bodies/ui/widgets/weight_chart.dart';


class ShowWeight extends StatefulWidget {
  @override
  _ShowWeightState createState() => _ShowWeightState();
}

class _ShowWeightState extends State<ShowWeight> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
       appBar: AppBar(
          backgroundColor: Palette.mainPurple,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Center(
            child: Text(
              "Check Your Proccess"
             
            ),
          ),
        ),
          body: ListView(children: <Widget>[
      Container(
        width:width ,
        height:height* 0.13,
        //color: Colors.blue,
        child: Column(
          children: <Widget>[
           
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                 
                  
                  Container(
                    width: width*0.3,
                    child: FlatButton(
                     //color: Palette.mainPurple,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Add Weight",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Palette.mainPurple,
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                          color: Palette.mainPurple,
                          width: 2,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(left:12.0),
                     child: Container(
                       width: width*0.3,
                       child: FlatButton(
                       //color: Palette.mainPurple,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            "My Weight",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              fontFamily: "OpenSans",
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        onPressed: () {},
                  ),
                     ),
                   ),

                ],
              ),
            ),
            Text("Add more Photos to control your process",style: TextStyle(fontWeight: FontWeight.w600),)
          ],
        ),
      ),
      
            Container(
              height: height*0.45,
            //  color: Colors.yellow,
 child: Column(
   mainAxisSize: MainAxisSize.max ,
   children: <Widget>[
     CarouselDemo(),
             Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Monday, Dec 1",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 27.0),
                                  )),
                             
                              FlatButton(
                     //color: Palette.mainPurple,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "57 Kg",
                        //  softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Palette.mainPurple,
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                          color: Palette.mainPurple,
                          width: 2,
                        ),
                      ),
                     onPressed: () {},
                    ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Your weight progress",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21.0),
                                  )),   
   ],
 ),
             ),
               Container(
              height: height*0.25,
             // color: Colors.blue,
               child:Padding(
                  padding: const EdgeInsets.only(left:20.0,right: 20.0),
                  child: Card(
                    elevation: 5.0,
                                      child: Container(
                      
                        // height: 250.0,
                         width: width,
                        // color: Palette.greyBackground,
                           
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: WeightChart(),
                                ),
                              
                            

                        ),
                  ),
                ),
             )
      
  ]),
    );
  }
  _buildCard( String imgPath, ) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            
          },
          child: Stack(
            children: <Widget>[
              Container(
                height: 215.0,
                width: 200.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.cover)),
              ),
              //make the shade a bit deeper.
              Container(
                height: 215.0,
                width: 200.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),),
                   // color: Colors.black.withOpacity(0.4)),
              ),
              Positioned(
                top: 10.0,
                left: 10.0,
                child: Row(
                  children: <Widget>[
                  
                   
                  ],
                ),
              ),
             
             
            ],
          ),
        ));
  }
}