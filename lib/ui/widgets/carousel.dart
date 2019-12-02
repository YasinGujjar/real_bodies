import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController _pagecontroller;
  int currentpage=4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pagecontroller=PageController(initialPage: currentpage,keepPage: false,viewportFraction: 0.5);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: PageView.builder(
            onPageChanged:(value) {
              setState(() {
                currentpage=value;
              });
            },
            controller: _pagecontroller,
            itemBuilder: (context,index)=> animateItemBuilder(index),
          ),
        ),
      ),
      
    );
  }
  animateItemBuilder(int index)
  {
    return AnimatedBuilder(animation: _pagecontroller,
    builder: (context,child)
    {
      double value=1;
      if(_pagecontroller.position.haveDimensions)
      {
        value=_pagecontroller.page-index;
        value=(1-(value.abs()*0.5)).clamp(0.0, 1.0);
      }
      return Center(
        child: SizedBox(
 height: Curves.easeOut.transform(value)*300,
 width: Curves.easeOut.transform(value)*250,  
 child: child,       
        ),
      );
    },
    child: Container(
margin: const EdgeInsets.all(10.0),
color: index % 2==0 ? Colors.blue:Colors.green,
child: FlutterLogo(),      
    ),
    );
  }
}