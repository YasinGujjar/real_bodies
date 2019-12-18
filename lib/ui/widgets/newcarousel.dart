import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 
class CarouselDemo extends StatefulWidget {
  final int id;
  final List img;
  final List weight;
  
  CarouselDemo({this.id,this.img,this.weight}) : super();
 
  final String title = "Carousel Demo";
 
  @override
  CarouselDemoState createState() => CarouselDemoState();
}
 
class CarouselDemoState extends State<CarouselDemo> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    /* 'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
   */];
 
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }


  URL urldomain =URL();
 void checkinfo() async
  {
   try
   {
      print("id weight"+widget.id.toString());
      print(DateTime.now().toString());
       var url=urldomain.domain+"get_weight_record";
    final response=await http.get(url+"&id="+widget.id.toString());
    print('Response body:${response.body}');
   var jsonResponse=json.decode(response.body);
 for(int i=0; i<jsonResponse.length; i++){
 imgList.add(URL.imageUrl+jsonResponse[i]['image']);
 }
print(imgList);
   }
   catch(e)
   {
     print("Exception on way $e");
   }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // checkinfo();
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            carouselSlider = CarouselSlider(
              height: 350.0,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: false,
              reverse: false,
              enableInfiniteScroll: false,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: widget.img.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 220,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.green,
                            ),
                            child: Image.network(
                              imgUrl[0],
                              fit: BoxFit.fill,
                            ),

                          ),
                           Text(
                                   imgUrl[1],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0),
                                  ),
                          FlatButton(
                     //color: Palette.mainPurple,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          imgUrl[2]+" Kg",
                         // widget.weight.toString(),
                        //  softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Palette.mainPurple,
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                          color: Palette.mainPurple,
                          width: 2,
                        ),
                      ),
                     onPressed: () {},
                    ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
            
                  
                 
                
          
                             /*  FlatButton(
                     //color: Palette.mainPurple,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "54 Kg",
                        //  softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Palette.mainPurple,
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                          color: Palette.mainPurple,
                          width: 2,
                        ),
                      ),
                     onPressed: () {},
                    ), */
           
          
          ],
        ),
      );
    
  }
 
 
}