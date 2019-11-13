import 'package:flutter/material.dart';

class InfoTextField extends StatefulWidget {
  final String postfix;
  final TextEditingController controller;
  final  PageController pageController;
  final String pagename;



  InfoTextField(
      {this.postfix,
      this.controller,
        this.pageController,
        this.pagename
     });

  _InfoTextFieldState createState() => _InfoTextFieldState();
}

class _InfoTextFieldState extends State<InfoTextField> {
  Color currentColor;
  bool validate =false;

  @override
  void initState() {
    super.initState();
   // currentColor = widget.borderColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
 widget.pageController.animateToPage(3, duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);
              }
               if(widget.pagename=="weight")
              {
 widget.pageController.animateToPage(4, duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);
              }
               if(widget.pagename=="height")
              {
                 widget.pageController.animateToPage(5, duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);
              }

             

            },
          ),
        ),
        Text(widget.postfix,style: TextStyle(color: Colors.white),),
      ],
    ),
  );
  }
}
