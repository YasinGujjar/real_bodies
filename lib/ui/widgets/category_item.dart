import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class CategoryItem extends StatefulWidget {
  final String name;
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final double elevation;
  final Color bgColor;
   Color click;

  

  CategoryItem(
      {this.name,
      this.icon,
      this.onPressed,
      this.color,
      this.elevation,
      this.bgColor,
      this.click,
     });

  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  
  

  @override
  void initState() {
    super.initState();
   // currentColor = widget.borderColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          
            margin: EdgeInsets.only(bottom: 10),
            width: 116,
            height: 116,
            child: FloatingActionButton(
              shape: CircleBorder(side: BorderSide(color: widget.click, width: 4.0)),
              elevation: widget.elevation,
              heroTag: widget.name,
              onPressed:(){
                
                  
              },
              backgroundColor:widget.bgColor,
              splashColor: Colors.blue,
              
              child: Icon(widget.icon, size: 45, color: Palette.mainPurple),
            )),
        Text(
          widget.name,
          style: TextStyle(
            color: widget.color,
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        )
      ],
    ),
  );
  }
}
