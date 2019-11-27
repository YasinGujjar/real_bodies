import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class FoodDiary extends StatefulWidget {
  @override
  _FoodDiaryState createState() => _FoodDiaryState();
}

class _FoodDiaryState extends State<FoodDiary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainPurple,
        title: Center(child: Text('Food Diary')),

      ),
      body: ListView(
       children: <Widget>[
         SizedBox(height: 5,),
         Padding(
           padding: const EdgeInsets.only(left:2.0,right: 2.0),
           child: Table(
             columnWidths: {0: FractionColumnWidth(.3)},
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
               child: Center(child: Text('Food',
                 style: TextStyle(
                   fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                 ),
               )),

             ),
                 ),

                  Center(
                    child: Container(
                      height: 37,
                      child: Center(child: Text('Calories',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                        ),
                      )),

                    ),
                  ),

                  Center(
                    child: Container(
                      height: 37,
                      child: Center(child: Text('Proteins',
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
                      child: Center(child: Text('Carbs',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                        ),
                      )),

                    ),
                  ),

                ],
              ),
               TableRow(

                 decoration: BoxDecoration(
                   border: Border(
                   bottom: BorderSide(
                     color: Colors.grey,
                     width: 1,
                   ),
                   ),
                 ),
                 children: [
                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('BreakFast',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),
                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('300',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),

                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('29g',
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
                       child: Center(child: Text('13g',
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
                       child: Center(child: Text('Egg whites',
                         style: TextStyle(
                           color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),
                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('56',
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
                       child: Center(child: Text('11',
                         style: TextStyle(
                           color:  Color(0xff94948d),
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
                       child: Center(child: Text('Protein Shake',
                         style: TextStyle(
                           color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),
                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('200',
                         style: TextStyle(
                           color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),

                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('12',
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
                       child: Center(child: Text('5',
                         style: TextStyle(
                           color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),

                 ],
               ),


             ],
           ),
         ),
         SizedBox(height: 5,),
         Center(child: Text('+Add Food',style: TextStyle(fontSize: 18,color: Palette.boldTextO),)),
         Padding(
           padding: const EdgeInsets.only(left:2.0,right: 2.0),
           child: Table(
             columnWidths: {0: FractionColumnWidth(.3)},
             defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
             children :[

               TableRow(

                 decoration: BoxDecoration(
                   border: Border(
                     bottom: BorderSide(
                       color: Colors.grey,
                       width: 1,
                     ),
                   ),
                 ),
                 children: [
                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('Lunch',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),
                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('300',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),

                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('29g',
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
                       child: Center(child: Text('13g',
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
                       child: Center(child: Text('Egg whites',
                         style: TextStyle(
                           color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),
                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('56',
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
                       child: Center(child: Text('11',
                         style: TextStyle(
                           color:  Color(0xff94948d),
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
                       child: Center(child: Text('Protein Shake',
                         style: TextStyle(
                           color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),
                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('200',
                         style: TextStyle(
                           color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),

                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('12',
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
                       child: Center(child: Text('5',
                         style: TextStyle(
                           color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),

                 ],
               ),


             ],
           ),
         ),
         SizedBox(height: 5,),
         Center(child: Text('+Add Food',style: TextStyle(fontSize: 18,color: Palette.boldTextO),)),
         Padding(
           padding: const EdgeInsets.only(left:2.0,right: 2.0),
           child: Table(
             columnWidths: {0: FractionColumnWidth(.3)},
             defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
             children :[

               TableRow(

                 decoration: BoxDecoration(
                   border: Border(
                     bottom: BorderSide(
                       color: Colors.grey,
                       width: 1,
                     ),
                   ),
                 ),
                 children: [
                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('Dinner',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),
                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('300',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),

                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('29g',
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
                       child: Center(child: Text('13g',
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
                       child: Center(child: Text('Egg whites',
                         style: TextStyle(
                           color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),
                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('56',
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
                       child: Center(child: Text('11',
                         style: TextStyle(
                           color:  Color(0xff94948d),
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
                       child: Center(child: Text('Protein Shake',
                         style: TextStyle(
                           color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),
                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('200',
                         style: TextStyle(
                           color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),

                   Center(
                     child: Container(
                       height: 37,
                       child: Center(child: Text('12',
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
                       child: Center(child: Text('5',
                         style: TextStyle(
                           color:  Color(0xff94948d),
                         ),
                       )),

                     ),
                   ),

                 ],
               ),


             ],
           ),
         ),
         SizedBox(height: 5,),
         Center(child: Text('+Add Food',style: TextStyle(fontSize: 18,color: Palette.boldTextO),)),

       ],
      ),
    );
  }
}
