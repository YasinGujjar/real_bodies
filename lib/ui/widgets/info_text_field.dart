import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/screens/height_page.dart';
import 'package:real_bodies/ui/screens/start_page.dart';
import 'package:real_bodies/ui/screens/weight_page.dart';

class InfoTextField extends StatefulWidget {
  final String postfix;
  final TextEditingController controller;
  final  PageController pageController;
  final String pagename;
   String goal="";
  String gender="";
  String age="";
  String height="";
  String weight="";



  InfoTextField(
      {this.postfix,
      this.controller,
        this.pageController,
        this.pagename,
        this.goal,
        this.gender,
        this.age,
        this.height,
        this.weight
        
     });

  _InfoTextFieldState createState() => _InfoTextFieldState();
}

class _InfoTextFieldState extends State<InfoTextField> {
  Color currentColor;
  bool validate =false;
  String ftvalue="";

  @override
  void initState() {
    super.initState();
   // currentColor = widget.borderColor;
  }

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Palette.mainPurple,
          child: Container(
        margin: EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 60,
              height: 60,
              child: TextField(
                
                controller: widget.controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                   enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          ),
                  focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                       ),
                  hintText: "0",
                  hintStyle: TextStyle(color: Colors.grey),
                  errorText: validate ? "Invalid" : null,

                ),
                keyboardType: TextInputType.number,
                cursorColor: Colors.white,
                maxLength: 2,
                maxLengthEnforced:true,

                style: new TextStyle(
                    fontSize: 40.0,
                    //height: 2.0,
                    color: Colors.white),
                onChanged: (text) {
                  int val = int.parse(text);
                    setState(() {
                  if (val<12 || text.length == 0) {
                   validate=true;
                  } else {
                   validate=false;
                  }
                });
                },
                onSubmitted: (text){
                  if(widget.pagename=="old")
                  {
 Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => WeightPage(goal:widget.goal,gender:widget.gender,age:text))); 
                  }
                   if(widget.pagename=="weight")
                  {
  Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => HeightPage(goal:widget.goal,gender:widget.gender,age:widget.age,weight:text))); 
                  }
                   /* if (widget.pagename=="ft")
                  {
                  //  setState(() {
                       ftvalue=text;
                    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"+ftvalue);
                   // });
                   
                  }
                   if(widget.pagename=="height")
                  {
                    print("ooooooooooo"+ftvalue);
                    /* Navigator.of(context)
                   .pushReplacement(MaterialPageRoute(builder: (context) => Starting(goal:widget.goal,gender:widget.gender,age:widget.age,weight:widget.weight,height:ftvalue+"Ft. "+text+"In."))); 
                  */ 
                 // ftvalue=text;
                    print("llllllllllllllllllllll"+ftvalue);
                  } */
                 

                 

                },
              ),
            ),
            Text(widget.postfix,style: TextStyle(color: Colors.white),),
          ],
        ),
  ),
    );
  }
}
