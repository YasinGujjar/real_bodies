import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class ProgressTracker extends StatefulWidget {
  @override
  _ProgressTrackerState createState() => _ProgressTrackerState();
}

class _ProgressTrackerState extends State<ProgressTracker> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: <Widget>[
          SizedBox(height: 3,),
          Center(child: Text('Training Week 1',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,),),),
          Padding(
            padding: const EdgeInsets.only(left:1.0,right: 1.0),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
              children :[

                TableRow(

                  decoration: BoxDecoration(
                    color: Color(0xffeeeeee),
                    border: Border.all(
                        color: Colors.grey,
                        width: 1
                    ),
                  ),
                  children: [
                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('Calories Goals',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),

                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('Target',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),

                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('Actual',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                          ),
                        ),
                        ),

                      ),
                    ),
                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('Remaining',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                          ),
                        ),
                        ),

                      ),
                    ),


                  ],
                ),
                TableRow(


                  children: [
                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('01-11-2019',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),
                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('1600',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),

                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('1500',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        ),
                        ),

                      ),
                    ),
                    Center(
                      child: Container(
                        height: 37,
                        child:
                            Center(
                              child: Text('100',
                                style: TextStyle(
                                  color:  Color(0xff94948d),
                                ),
                              ),
                            ),




                      ),
                    ),

                  ],
                ),
                TableRow(


                  children: [
                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('01-11-2019',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),
                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('1600',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),

                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('1500',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        ),
                        ),

                      ),
                    ),
                    Center(
                      child: Container(
                        height: 37,
                        child:
                        Center(
                          child: Text('100',
                            style: TextStyle(
                              color:  Color(0xff94948d),
                            ),
                          ),
                        ),




                      ),
                    ),

                  ],
                ),
                TableRow(


                  children: [
                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('01-11-2019',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),
                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('1600',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),

                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('1700',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        ),
                        ),

                      ),
                    ),
                    Center(
                      child: Container(
                        height: 37,
                        child:
                        Center(
                          child: Text('-100',
                            style: TextStyle(
                              color:  Colors.red,
                            ),
                          ),
                        ),




                      ),
                    ),

                  ],
                ),



              ],
            ),
          ),

        ],
      );


  }
}
