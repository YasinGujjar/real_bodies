import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class ExerciseDiary extends StatefulWidget {
  final String title;
  ExerciseDiary({this.title});
  @override
  _ExerciseDiaryState createState() => _ExerciseDiaryState();
}

class _ExerciseDiaryState extends State<ExerciseDiary> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: <Widget>[
           SizedBox(height: 3,),
         Center(child: Text(widget.title,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color:Palette.boldTextO),),),
          Padding(
            padding: const EdgeInsets.only(left:1.0,right: 1.0),
            child: Table(
              columnWidths: {0: FractionColumnWidth(.3), 4:FractionColumnWidth(.4)},
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
                        child: Center(child: Text('Exercise',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),

                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('Time',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),

                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('Sets',
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
                        child: Center(child: Text('Reps',
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
                        child: Center(child: Text('Logged',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),

                  ],
                ),
                TableRow(


                  children: [
                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('Push Ups',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),
                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('6',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),

                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('9',
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('4',
                              style: TextStyle(
                                color:  Color(0xff94948d),
                              ),
                            ),
                            Icon(Icons.check),
                          ],
                        ),

                      ),
                    ),
                    Center(
                      child: Container(
                        height: 37,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 20,
                              width:  50,
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                onPressed: () {},
                                color: Palette.boldTextO,
                                textColor: Colors.white,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text("View".toUpperCase(),
                                      style: TextStyle(fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              width:  50,
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                onPressed: () {},
                                color: Palette.boldTextO,
                                textColor: Colors.white,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text("Log".toUpperCase(),
                                      style: TextStyle(fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              width:  50,
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                onPressed: () {},
                                color: Palette.boldTextO,
                                textColor: Colors.white,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text("Done".toUpperCase(),
                                      style: TextStyle(fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),

                          ],
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
                        child: Center(child: Text('Jumping Jack',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),
                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('6',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),

                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('9',
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('4',
                              style: TextStyle(
                                color:  Color(0xff94948d),
                              ),
                            ),
                            Icon(Icons.check),
                          ],
                        ),

                      ),
                    ),
                    Center(
                      child: Container(
                        height: 37,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 20,
                              width:  50,
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                onPressed: () {},
                                color: Palette.boldTextO,
                                textColor: Colors.white,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text("View".toUpperCase(),
                                      style: TextStyle(fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              width:  50,
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                onPressed: () {},
                                color: Palette.boldTextO,
                                textColor: Colors.white,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text("Log".toUpperCase(),
                                      style: TextStyle(fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              width:  50,
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                onPressed: () {},
                                color: Palette.boldTextO,
                                textColor: Colors.white,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text("Done".toUpperCase(),
                                      style: TextStyle(fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),

                          ],
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
                        child: Center(child: Text('Push Ups',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),
                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('8',
                          style: TextStyle(
                            color:  Color(0xff94948d),
                          ),
                        )),

                      ),
                    ),

                    Center(
                      child: Container(
                        height: 37,
                        child: Center(child: Text('15',
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('6',
                              style: TextStyle(
                                color:  Color(0xff94948d),
                              ),
                            ),
                            //Icon(Icons.check),
                          ],
                        ),

                      ),
                    ),
                    Center(
                      child: Container(
                        height: 37,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 20,
                              width:  50,
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                onPressed: () {},
                                color: Palette.boldTextO,
                                textColor: Colors.white,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text("View".toUpperCase(),
                                      style: TextStyle(fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              width:  50,
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                onPressed: () {},
                                color: Palette.boldTextO,
                                textColor: Colors.white,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text("Log".toUpperCase(),
                                      style: TextStyle(fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              width:  50,
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                onPressed: () {},
                                color: Palette.boldTextO,
                                textColor: Colors.white,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text("Done".toUpperCase(),
                                      style: TextStyle(fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),

                          ],
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
