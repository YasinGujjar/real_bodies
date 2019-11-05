import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class CategoryItem extends StatefulWidget {
  final String name;
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final double elevation;

  

  CategoryItem(
      {this.name,
      this.icon,
      this.onPressed,
      this.color,
      this.elevation,
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
              shape: CircleBorder(),
              elevation: widget.elevation,
              heroTag: widget.name,
              onPressed: widget.onPressed,
              backgroundColor: Palette.greyBackground,
              splashColor: Colors.blue,
              child: Icon(widget.icon, size: 45, color: Colors.black87),
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
