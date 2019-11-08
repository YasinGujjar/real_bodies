import "package:flutter/material.dart";
import 'package:real_bodies/theme/palette.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
   double width=MediaQuery.of(context).size.width;
    return Scaffold(
    appBar: new AppBar(
        backgroundColor: Palette.mainPurple,
        elevation: 9.0,
        //      iconTheme: new IconThemeData(color: Colors.blue), //set color of icon
        title: Text('User Profile'),
        centerTitle: true,
      ),
       body:
       ListView(
children: <Widget>[
             Column(
          children: <Widget>[
             Stack(
                      children: <Widget>[
                        Container(height: 220.0),
                        Container(
                          height: 170.0,
                          
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              ),
                              //color: Colors.blue,
                              image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.9), BlendMode.dstATop),
            image: AssetImage('assets/images/mountains.jpg'),
           fit: BoxFit.cover,
          ), ),
                        ),
                        Positioned(
                            top: 120.0,
                            left: 20.0,
                            
                            child: Container(
                              
                              height: 80.0,
                              width: 80.0,
                              decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(45.0),
                                  
                                 image: DecorationImage(
                                   image: ExactAssetImage('assets/images/fit2.jpg'),
      fit: BoxFit.cover,
                                 ) ),
                            ))
                      ],
                    ),
                     Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Card(
                  elevation: 5.0,
                 child: Container(
                     height: 70.0,
                     width: width,
                    // color: Palette.greyBackground,
                        child: Center(
                          child: Text("CyberMetores",
                          style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
                        ),

                    ),
                  
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Card(
                //  elevation: 10.0,
                 child: Container(
                     height: 250.0,
                    // color: Palette.greyBackground,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: categories(),
                          ),
                        ),

                    ),
                  
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Card(
                 // elevation: 10.0,
                 child: Container(
                     height: 200.0,
                    // color: Palette.greyBackground,
                        

                    ),
                  
                ),
              ),
          ]
             ),
]
),   
    );
  }
}

//list
Widget categories() {
  return Container(
    height: 185,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        CategoryListItem(
          categoryIcon: Icons.edit,
          categoryName: "Gender",
          value: "Male",
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.edit,
          categoryName: "Age",
          value: "22",
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.edit,
          categoryName: "height",
          value: "5ft 9In",
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.edit,
          categoryName: "Weight",
          value: "57Kg",
          selected: false,
        ),
       
      ],
    ),
  );
}

//class
class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    Key key,
    @required this.categoryIcon,
    @required this.categoryName,
    @required this.value,
    @required this.selected,
  }) : super(key: key);

  final IconData categoryIcon;
  final String categoryName;
  final String value;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: selected ? Palette.mainPurple : Colors.white,
        border: Border.all(
            color: selected ? Colors.transparent : Colors.grey[200],
            width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 15,
            offset: Offset(15, 0),
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
             splashColor: Colors.blue,
                    onTap: () {
                      print("tapped Edit");
                    },
                      child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                //  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: selected ? Colors.transparent : Colors.grey[200],
                      width: 1.5)),
              child: Icon(
                categoryIcon,
                color: Palette.mainPurple,
                size: 30,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            categoryName,
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.black, fontSize: 15),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 6, 0, 10),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            value.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
 
