import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_flat_button.dart';


class AddNewFood extends StatefulWidget {
  @override
  _AddNewFoodState createState() => _AddNewFoodState();
}

class _AddNewFoodState extends State<AddNewFood>
     {
       TextEditingController nameController=TextEditingController();
       bool validate=false;
       String error;



  @override
  void initState() {
    super.initState();
   
  }

  @override
  void dispose() {
    super.dispose();
   
  }


  


  @override
 Widget build(BuildContext context) {
  
    return new Scaffold(
      
      body:
       Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.05), BlendMode.dstATop),
            image: AssetImage('assets/images/fit2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
       
          child: Center(
            child: SingleChildScrollView(
              child: new Column(
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                 Container(
                   
                   padding: EdgeInsets.only(top:0.0),
                    child: Icon(
                     Icons.fastfood,
                     color: Color(0xff00a65a),
                     size: 50.0,
                   ),
                    

                 ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "Food Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:   Palette.mainPurple,

                      fontSize: 15.0,
                      ),
                    ),
                        ),
                      ),
                    ],
                    ),
                  ),
                  new Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                    color:   Palette.mainPurple,

                  width: 0.9,
                    style: BorderStyle.solid),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                  child: TextField(
                   // controller: _controller,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Food name...',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                      ),
                    ],
                  ),
                  ),

                  new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 30.0),
                  child: new Text(
                    "Calories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.mainPurple,
                      fontSize: 15.0,
                    ),
                  ),
                      ),
                    ),
                  ],
                  ),
                  new Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 0.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                   
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                  child: TextField(
                    //controller: _controller1,
                    //obscureText: true,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                     style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                       enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Palette.mainPurple),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan)),
                      hintText: '',
                      
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                      ),
                    ],
                  ),
                  ),
                   new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 30.0),
                  child: new Text(
                    "Protiens",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.mainPurple,
                      fontSize: 15.0,
                    ),
                  ),
                      ),
                    ),
                  ],
                  ),
                  new Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 0.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                   
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                  child: TextField(
                    //controller: _controller1,
                   // obscureText: true,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                     style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                       enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Palette.mainPurple),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan)),
                      hintText: '',
                      
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                      ),
                    ],
                  ),
                  ),
                   new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 30.0),
                  child: new Text(
                    "Fats",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.mainPurple,
                      fontSize: 15.0,
                    ),
                  ),
                      ),
                    ),
                  ],
                  ),
                  new Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 0.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                   
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                  child: TextField(
                    //controller: _controller1,
                    //obscureText: true,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                     style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                       enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Palette.mainPurple),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan)),
                      hintText: '',
                      
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                      ),
                    ],
                  ),
                  ),
                   new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 30.0),
                  child: new Text(
                    "Carbohydrates",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.mainPurple,
                      fontSize: 15.0,
                    ),
                  ),
                      ),
                    ),
                  ],
                  ),
                  new Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 0.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                   
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                  child: TextField(
                    //controller: _controller1,
                   // obscureText: true,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                     style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                       enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Palette.mainPurple),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan)),
                      hintText: '',
                      
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                      ),
                    ],
                  ),
                  ),

                

                  new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: new FlatButton(
                  child: new Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff00a65a),
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () => {},
                      ),
                    ),
                  ],
                  ),
                  new Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                  alignment: Alignment.center,
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Palette.mainPurple,
                    onPressed: () async  {
                    
                   
                      
                      
                      print("name:");
                     
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()),);
                     

                    },
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "Add Food",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                      ),
                    ],
                  ),
                  ),
                ],
              ),
            ),
          ),
        
      ),
    );
  



  }
}
