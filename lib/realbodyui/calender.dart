import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  CalendarController _calendarController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarController=CalendarController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Palette.mainPurple,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Center(child: Text("Calender"),)
          
      ),
      body: SingleChildScrollView(
      
         child : Column(
            children: <Widget>[
              TableCalendar(calendarController: _calendarController,calendarStyle: CalendarStyle(
                todayColor: Palette.mainPurple,

                selectedColor: Theme.of(context).primaryColor,
              ),
              onDaySelected:(date, events){
print(date.toIso8601String());
              },),
 Container(height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
            child: Center(
              child: Container(
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text('Note',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30),)),
              ),
            ),),
            SizedBox(height: 10.0,),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 20.0,
                        width: 20.0,
                       // color: Colors.blue,
                         decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(45.0)),
                         child: Center(child: Text("1"))
                        
                      ),
                      Container(
                        //color: Colors.blue,
                        width: 300,
                        height: 40,
                        child:AutoSizeText(" You exercise 40 minutes a day and five days a week at a certain time, you practice on a regular schedule. Changing the schedule will result in diminished results, resulting in fatigue."),
                      )
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 20.0,
                        width: 20.0,
                       // color: Colors.blue,
                         decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(45.0)),
                         child: Center(child: Text("2"))
                        
                      ),
                      Container(
                        //color: Colors.blue,
                        width: 300,
                        height: 40,
                        child:AutoSizeText("Tips for weight loss work towards functional exercises, proven strength and balance, and reduced risk of injury when muscle groups are active at the same time."),
                      )
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 20.0,
                        width: 20.0,
                       // color: Colors.blue,
                         decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(45.0)),
                         child: Center(child: Text("3"))
                        
                      ),
                      Container(
                        //color: Colors.blue,
                        width: 300,
                        height: 60,
                        child:AutoSizeText("You should take the time to exercise whenever, wherever, whenever possible: Treadmill and exercise bike at home 15 minutes a day, ... at work and even when doing Take care of your home by going up and down, climbing stairs or cleaning your belongings instead of standing still."),
                      )
                    ],
                  ),
                )
              ],
            )
            ],
          )
        
      ),
      
    );
  }
}