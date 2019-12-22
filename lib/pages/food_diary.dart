import 'package:flutter/material.dart';
import 'package:real_bodies/models/food_categories.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/pages/search_food.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodDiary extends StatefulWidget {
  final int id;
  final Function() notifyParent;
  final String calorie;
  
  FoodDiary({Key key, @required this.notifyParent,this.id,this.calorie}) : super(key: key);
  @override
  _FoodDiaryState createState() => _FoodDiaryState();
}

class _FoodDiaryState extends State<FoodDiary> {

  List<TableRowReturn> snackList = [];
  List<TableRowReturn> breakFastList = [];
  List<TableRowReturn> lunchList =[];
  List<TableRowReturn> dinnerList = [];
  List<String> kFoods;

  URL urldomain =URL();
 void checkinfo() async
  {
   try
   {
      print("id diary"+widget.id.toString());
      print(DateTime.now().toString());
       var url=urldomain.domain+"get_food_record";
    final response=await http.get(url+"&id="+widget.id.toString());
    print('Response body:${response.body}');
   var jsonResponse=json.decode(response.body);
  for(int i=0; i<jsonResponse.length; i++){
if (jsonResponse[i]['category']=="breakfast")
{
addbreakfast(breakFastList,jsonResponse,i);
}
if(jsonResponse[i]['category']=="lunch")
{
addbreakfast(lunchList,jsonResponse,i);
}
if(jsonResponse[i]['category']=="dinner")
{
  addbreakfast(dinnerList,jsonResponse,i);
}
if(jsonResponse[i]['category']=="snacks")
{
  addbreakfast(snackList,jsonResponse,i);
}
        // breakFastList.add(   TableRowReturn(
        //          name: jsonResponse[i]['name'],
        //          calories: jsonResponse[i]['calories'].toString(),
        //          proteins: jsonResponse[i]['protein'].toString(),
        //          carbs:jsonResponse[i]['carbo'].toString(),

        //        ),
        //        );
        //        widget.notifyParent();
               
     }
     print(breakFastList);
     
  //    var requestresponse=jsonResponse['response'];
   /*     
      if (requestresponse=="success")
{
  var name=jsonResponse['name'];
   var calorie=jsonResponse['calories'];
    var weight=jsonResponse['weight'];
  int id= int.parse(jsonResponse['id']);
  
  print('This is the idddddd   heloo$id');


 /* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DashBoard(id: id,name: name,weight:weight,calorie:calorie)),
  ); */


  }
else if(requestresponse=="error")
{

  print("error login");
} 
 */

   }
   catch(e)
   {
     print("Exception on way $e");
   }
  }
   void addbreakfast(listname,jsonResponse,i)
   {
  listname.add(   TableRowReturn(
                 name: jsonResponse[i]['name'],
                 calories: jsonResponse[i]['calories'].toString(),
                 proteins: jsonResponse[i]['protein'].toString(),
                 carbs:jsonResponse[i]['carbo'].toString(),

               ),
               );
               widget.notifyParent();
   }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkinfo();

  }

  @override
  Widget build(BuildContext context) {
     //checkinfo();
    return
       Column(
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
//               TableRow(
//
//
//                 children: [
//                   Center(
//                     child: Container(
//                       height: 37,
//                       child: Center(child: Text('Egg whites',
//                         style: TextStyle(
//                           color:  Color(0xff94948d),
//                         ),
//                       )),
//
//                     ),
//                   ),
//                   Center(
//                     child: Container(
//                       height: 37,
//                       child: Center(child: Text('56',
//                         style: TextStyle(
//                           color:  Color(0xff94948d),
//                         ),
//                       )),
//
//                     ),
//                   ),
//
//                   Center(
//                     child: Container(
//                       height: 37,
//                       child: Center(child: Text('9',
//                         style: TextStyle(
//                           color:  Color(0xff94948d),
//                         ),
//                       ),
//                       ),
//
//                     ),
//                   ),
//                   Center(
//                     child: Container(
//                       height: 37,
//                       child: Center(child: Text('11',
//                         style: TextStyle(
//                           color:  Color(0xff94948d),
//                         ),
//                       )),
//
//                     ),
//                   ),
//
//                 ],
//               ),
//               TableRow(
//
//
//                 children: [
//                   Center(
//                     child: Container(
//                       height: 37,
//                       child: Center(child: Text('Protein Shake',
//                         style: TextStyle(
//                           color:  Color(0xff94948d),
//                         ),
//                       )),
//
//                     ),
//                   ),
//                   Center(
//                     child: Container(
//                       height: 37,
//                       child: Center(child: Text('200',
//                         style: TextStyle(
//                           color:  Color(0xff94948d),
//                         ),
//                       )),
//
//                     ),
//                   ),
//
//                   Center(
//                     child: Container(
//                       height: 37,
//                       child: Center(child: Text('12',
//                         style: TextStyle(
//                           color:  Color(0xff94948d),
//                         ),
//                       ),
//                       ),
//
//                     ),
//                   ),
//                   Center(
//                     child: Container(
//                       height: 37,
//                       child: Center(child: Text('5',
//                         style: TextStyle(
//                           color:  Color(0xff94948d),
//                         ),
//                       )),
//
//                     ),
//                   ),
//
//                 ],
//               ),


             ],
           ),
         ),
         ListView.builder(
           physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             itemCount: breakFastList.length,
             itemBuilder: (BuildContext context, int index){
               return breakFastList[index];
             }
         ),

         SizedBox(height: 5,),
         GestureDetector(
             onTap: (){
               Navigator.of(context)
                   .push(MaterialPageRoute(builder: (context) => SearchFood(id:widget.id,category: FoodCategories.breakfast,calorie:widget.calorie)));
              /*  breakFastList.add(   TableRowReturn(
                 name: 'Cherry Coke',
                 calories: 45,
                 proteins: 0.5,
                 carbs: 5,

               ),
               );
               widget.notifyParent(); */

             },
             child: Center(child: Text('+Add Food',style: TextStyle(fontSize: 18,color: Palette.boldTextO),))),
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
               


             ],
           ),
         ),
         ListView.builder(
             physics: NeverScrollableScrollPhysics(),

             shrinkWrap: true,
             itemCount: lunchList.length,
             itemBuilder: (BuildContext context, int index){
               return lunchList[index];
             }
         ),

         SizedBox(height: 5,),
         GestureDetector(
             onTap: (){
               Navigator.of(context)
                   .push(MaterialPageRoute(builder: (context) => SearchFood(id:widget.id,category: FoodCategories.lunch,calorie:widget.calorie)));
              /*  lunchList.add(   TableRowReturn(
                 name: 'Cherry Coke',
                 calories: "45",
                 proteins: "0.5",
                 carbs: "5",

               ),
               );
               widget.notifyParent(); */

             },
             child: Center(child: Text('+Add Food',style: TextStyle(fontSize: 18,color: Palette.boldTextO),))),
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
               




             ],

           ),

         ),

         ListView.builder(
             physics: NeverScrollableScrollPhysics(),

             shrinkWrap: true,
           itemCount: dinnerList.length,
             itemBuilder: (BuildContext context, int index){
             return dinnerList[index];
             }
         ),


         SizedBox(height: 5,),
         GestureDetector(
           onTap: (){
             Navigator.of(context)
                 .push(MaterialPageRoute(builder: (context) => SearchFood(id:widget.id,category: FoodCategories.dinner,calorie:widget.calorie)));
             /* dinnerList.add(   TableRowReturn(
               name: 'Cherry Coke',
               calories: "45",
               proteins: "0.5",
               carbs: "5",

             ),
             );
             widget.notifyParent(); */

           },
             child: Center(child: Text('+Add Food',style: TextStyle(fontSize: 18,color: Palette.boldTextO),))),

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
                       child: Center(child: Text('Snacks',
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
               
              



             ],

           ),

         ),

         ListView.builder(
             physics: NeverScrollableScrollPhysics(),

             shrinkWrap: true,
             itemCount: snackList.length,
             itemBuilder: (BuildContext context, int index){
               return snackList[index];
             }
         ),


         SizedBox(height: 5,),
         GestureDetector(
             onTap: (){

               Navigator.of(context)
                   .push(MaterialPageRoute(builder: (context) => SearchFood(id:widget.id,category: FoodCategories.snacks,calorie:widget.calorie)));
             /*   snackList.add(   TableRowReturn(
                 name: 'Cherry Coke',
                 calories: "45",
                 proteins: "0.5",
                 carbs: "5",

               ),
               );
               widget.notifyParent(); */

             },
             child: Center(child: Text('+Add Food',style: TextStyle(fontSize: 18,color: Palette.boldTextO),))),

       ],
      );

  }
}

class TableRowReturn extends StatelessWidget {
  final String name;
  final String calories;
  final String proteins;
  final String carbs;

  TableRowReturn({this.name,this.calories,this.proteins,this.carbs});
  @override
  Widget build(BuildContext context) {
    print('nameeee'+name);
    return
      Padding(
        padding: const EdgeInsets.only(left:2.0,right:2.0),
        child: Table(
    columnWidths: {0: FractionColumnWidth(.3)},
    defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
    children :[

    TableRow(


    children: [
    Center(
    child: Container(
    height: 37,
    child: Center(child: Text('$name',
    
    style: TextStyle(
    color:  Color(0xff94948d),
    ),
    )),

    ),
    ),
    Center(
    child: Container(
    height: 37,
    child: Center(child: Text('$calories',
    style: TextStyle(
    color:  Color(0xff94948d),
    ),
    )),

    ),
    ),

    Center(
    child: Container(
    height: 37,
    child: Center(child: Text('$proteins',
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
    child: Center(child: Text('$carbs',
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
      );

  }
}

