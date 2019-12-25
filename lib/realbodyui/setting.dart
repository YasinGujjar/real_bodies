import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
 bool switch1=false;
 bool switch2=false;
 bool switch3=false;
 bool switch4=false;
 bool switch5=false;
 bool switch6=false;
 bool switch7=false;
 bool switch8=false;
 bool switch9=false;
 int _cupertinoSliderValue=2;
 int _cupertinoSliderValue2=4;
 int _cupertinoSliderValue3=6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Palette.mainPurple,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Center(child: Text("Setting"),)
          
      ),
      body:ListView(
        children: <Widget>[
          SizedBox(height: 10,),
           ListTile(
    title: Text('GPS'),
    trailing: CupertinoSwitch(
      value: switch1,
      onChanged: (bool value) { setState(() { switch1 = value; }); },
    ),
    onTap: () { setState(() { switch1 = !switch1; }); },
  ),
  Divider(height: 2,thickness: 2.0,),
    ListTile(
    title: Text('Auto Pause'),
    trailing: CupertinoSwitch(
      value: switch2,
      onChanged: (bool value) { setState(() { switch2 = value; }); },
    ),
    onTap: () { setState(() { switch2 = !switch2; }); },
  ),
   Divider(height: 2,thickness: 2.0,),
    ListTile(
    title: Text('Pause run for calls'),
    trailing: CupertinoSwitch(
      value: switch3,
      onChanged: (bool value) { setState(() { switch3 = value; }); },
    ),
    onTap: () { setState(() { switch3 = !switch3; }); },
  ), 
   Divider(height: 2,thickness: 2.0,), ListTile(
    title: Text('Voice Volume'),
    trailing: CupertinoSwitch(
      value: switch4,
      onChanged: (bool value) { setState(() { switch4 = value; }); },
    ),
    onTap: () { setState(() { switch4 = !switch4; }); },
  ),
   Divider(height: 2,thickness: 2.0,),
Padding(
  padding: const EdgeInsets.only(left:10.0,top: 10.0),
  child:   Text("Audio Feed back"),
),
Padding(
  padding: const EdgeInsets.only(left:25.0,right: 25.0),
  child:   CupertinoSlider(
  
    value: _cupertinoSliderValue.toDouble(),
  
    min: 1.0,
  
    max: 10.0,
  
    divisions: 10,
  
    onChanged: (double newValue) {
  
      setState(() {
  
        _cupertinoSliderValue = newValue.round();
  
      });
  
    },
  
  ),
),
 Divider(height: 2,thickness: 2.0,),
 Padding(
  padding: const EdgeInsets.only(left:10.0,top: 10.0),
  child:   Text("Time"),
),
Padding(
  padding: const EdgeInsets.only(left:25.0,right: 25.0),
  child:   CupertinoSlider(
  
    value: _cupertinoSliderValue2.toDouble(),
  
    min: 1.0,
  
    max: 10.0,
  
    divisions: 10,
  
    onChanged: (double newValue) {
  
      setState(() {
  
        _cupertinoSliderValue2 = newValue.round();
  
      });
  
    },
  
  ),
),
 Divider(height: 2,thickness: 2.0,),
 Padding(
  padding: const EdgeInsets.only(left:10.0,top: 10.0),
  child:   Text("Distance"),
),
Padding(
  padding: const EdgeInsets.only(left:25.0,right: 25.0),
  child:   CupertinoSlider(
  
    value: _cupertinoSliderValue3.toDouble(),
  
    min: 1.0,
  
    max: 10.0,
  
    divisions: 10,
  
    onChanged: (double newValue) {
  
      setState(() {
  
        _cupertinoSliderValue3 = newValue.round();
  
      });
  
    },
  
  ),
),
 Divider(height: 2,thickness: 2.0,),

   ListTile(
    title: Text('Time'),
    trailing: CupertinoSwitch(
      value: switch5,
      onChanged: (bool value) { setState(() { switch5 = value; }); },
    ),
    onTap: () { setState(() { switch5 = !switch5; }); },
  ), 
   Divider(height: 2,thickness: 2.0,), ListTile(
    title: Text('Distance'),
    trailing: CupertinoSwitch(
      value: switch6,
      onChanged: (bool value) { setState(() { switch6 = value; }); },
    ),
    onTap: () { setState(() { switch6 = !switch6; }); },
  ),  Divider(height: 2,thickness: 2.0,),
   ListTile(
    title: Text('Pace'),
    trailing: CupertinoSwitch(
      value: switch7,
      onChanged: (bool value) { setState(() { switch7 = value; }); },
    ),
    onTap: () { setState(() { switch7 = !switch7; }); },
  ),
   Divider(height: 2,thickness: 2.0,),  ListTile(
    title: Text('Speed'),
    trailing: CupertinoSwitch(
      value: switch8,
      onChanged: (bool value) { setState(() { switch8 = value; }); },
    ),
    onTap: () { setState(() { switch8 = !switch8; }); },
  ), 
   Divider(height: 2,thickness: 2.0,), ListTile(
    title: Text('Calories'),
    trailing: CupertinoSwitch(
      value: switch9,
      onChanged: (bool value) { setState(() { switch9 = value; }); },
    ),
    onTap: () { setState(() { switch9 = !switch9; }); },
  ),
  Divider(height: 2,thickness: 2.0,),
 Padding(
  padding: const EdgeInsets.only(left:10.0,top: 10.0),
  child:   GestureDetector(
    onTap: (){
      
    },
    child: Text("Logout")),
),
SizedBox(height: 30,)
        ],
      ),
      
    );
  }
}