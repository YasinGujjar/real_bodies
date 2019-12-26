import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_bodies/realbodyui/shop_nutrition.dart';
import 'package:real_bodies/realbodyui/shop_product.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class Shop extends StatefulWidget {
  final int id;
  Shop({this.id});
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top ;
     return MaterialApp(

      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Palette.mainPurple,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Center(child: Text('Shop'),),

            bottom: ColoredTabBar(
              color: Colors.white,
              tabBar: TabBar(
                    unselectedLabelColor: Colors.grey,
                tabs: <Widget>[
                  Tab(text: 'Services',),
                  Tab(text: 'Product',),
                  Tab(text: 'Nutrition',),
                  
                ],
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: new BubbleTabIndicator(
                  indicatorHeight: 25.0,
                  indicatorColor: Palette.mainPurple,
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,

                ),
              ),
            ),
          ),
          body:TabBarView(children: [
            ShopServices(id:widget.id),
            ShopProduct(id:widget.id),
            ShopNutrition(id: widget.id,),
            

          ],),
        ),
      ),
    );

      
    
  }
}

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar({this.color, this.tabBar});

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
    color: color,
    child: tabBar,
  );
}



class ShopServices extends StatefulWidget {
   final int id;
  ShopServices({this.id});
  @override
  _ShopServicesState createState() => _ShopServicesState();
}
class _ShopServicesState extends State<ShopServices> {
  

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
  
  }

  @override
  Widget build(BuildContext context) {
   return ListView(
        children: <Widget>[

Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(child: Text("Services",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0),),),
),
  Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              height: 215.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildCard(
                      'Full Body', "description write here",Colors.blue),
                  _buildCard(
                      'Biceps, Triceps', "description write here",Palette.mainPurple),
                       _buildCard(
                      'Flexibility Exercise',"description write here",Colors.green),
                ],
              ),
            ),
          ),
          Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(child: Text("Fitness Plan",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0),),),
),
           ProgramList(title:"30 Days Summer", description:"hhgfhchfgfhf",id: widget.id,programId: 1,image: "assets/images/bodgoal1.png"),
           SizedBox(height: 10),
           ProgramList(title:"exercise", description:"hhgfhchfgfhf",id: widget.id,programId: 2,image: "assets/images/bodgoal22.png"),
            SizedBox(height: 10),
           ProgramList(title:"exercise", description:"hhgfhchfgfhf",id: widget.id,programId: 1,image: "assets/images/bodgoal4.png"),
            SizedBox(height: 10),
           ProgramList(title:"exercise", description:"hhgfhchfgfhf",id: widget.id,programId: 1,image: "assets/images/bodgoal22.png"),
            SizedBox(height: 10),
           ProgramList(title:"exercise", description:"hhgfhchfgfhf",id: widget.id,programId: 1,image: "assets/images/bodgoal1.png"),
            SizedBox(height: 10),
           //ProgramList(title:"exercise", description:"hhgfhchfgfhf",id: widget.id,programId: 1,image: "assets/images/bodgoal1.png"),
            SizedBox(height: 10),
          // ProgramList(title:"exercise", description:"hhgfhchfgfhf",id: widget.id,programId: 1,image: "assets/images/bodgoal1.png"),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(child: Text("Other Services",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0),),),
),
 _buildCard(
                      'Flexibility Exercise',"description write here",Palette.mainPurple),
                       _buildCard(
                      'Flexibility Exercise',"description write here",Palette.greyBackground),
                       _buildCard(
                      'Flexibility Exercise', "description write here",Palette.darkPink),
        ],
      );
  
  }

  @override
  void dispose() {
    super.dispose();
   
  }
  _buildCard(String title, String description,Color colorsec) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
          /*   if (page=="exercise")
            {
               Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Exercise()));
             }
            if (page=="food")
            { Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FoodDiaryToday())); 
            }
            if (page=="blog")
            { /* Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Exercise()));  */
            } 
            if(page=="workout")
            {
               Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => DailyWorkOutPlan())); 
            }
            if(page=="foodDetail")
            {
               Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FoodDetails())); 
            } */
          },
          child: Stack(
            children: <Widget>[
              Container(
                height: 215.0,
                width: 260.0,

                decoration: BoxDecoration(
                  color: colorsec,
                    borderRadius: BorderRadius.circular(20.0),
                   ),
              ),
              //make the shade a bit deeper.
              Container(
                height: 215.0,
                width: 260.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                   // color: Colors.black.withOpacity(0.4)
                   ),
              ),
              Positioned(
                top: 10.0,
                left: 10.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        //  color: Colors.black.withOpacity(0.2)
                        ),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                         Text('Workout & Meal Plan',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),
                         //     FittedBox(fit:BoxFit.contain,child: Text(this.widget.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),

                        ],
                      )),
                    ),
                    SizedBox(width:70.0),
                    Text(
                      'See More',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Opensans'),
                    ),
                    SizedBox(width: 7.0),
                    //this should be an iconbutton in a real app.
                    Icon(Icons.arrow_drop_down, color: Colors.white, size: 25.0)
                  ],
                ),
              ),
              Positioned(
                top: 65.0,
                left: 10.0,
                child: Container(
                  width: 150.0,
                  child: Text(description,
                      style: TextStyle(
                          fontFamily: 'Opensans',
                          fontSize: 17.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              Positioned(
                top: 165.0,
                left: 10.0,
                child: Container(
                  width: 150.0,
                  child: Text(title,
                      style: TextStyle(
                          fontFamily: 'Opensans',
                          fontSize: 17.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
              ),
             
            ],
          ),
        ));
  }

}


class ProgramList extends StatefulWidget {
  final String title;
  final String description;
  var document;
  final String image;
  final int id;
   final int programId;
  /*final String name;
  final String calorie;
  final String email;
  final String password; */
 // final ProgramPlan program;

  ProgramList({this.title,this.description,this.id,this.programId,this.image,this.document});

  @override
  _ProgramListState createState() => _ProgramListState();
}

class _ProgramListState extends State<ProgramList> {
    String _name="";
  String _pass="";
  String argName = "";
  String argPassword="";
  String argUserName="";
/* void buyProgram(int id, int programId ) async {
  URL urldomain = URL();
  var url=urldomain.domain+"buy_program";

  final response =await http.get(url+"&id="+id.toString()+"&program_id="+programId.toString());

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
   // r Post.fromJson(json.decode(response.body));
   
    print('Response body:${response.body}');
    Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) => DashBoard(id:widget.id,name:widget.name,indexnumber: 0,calorie:widget.calorie)));
             argName=widget.email;
                    argPassword=widget.password;
                    argUserName=widget.name;
                    print("name:"+argName+" Password:"+argPassword+"userName:"+argUserName);
                    saveNamePreference(argName,argPassword,argUserName);

  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
 */
  @override
  Widget build(BuildContext context) {
    return
      Padding(
          padding: EdgeInsets.only(left: 12,right: 12),
          child: Container(

            height: 200,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right:20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top:10.0,bottom: 8.0,left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Workout & Meal Plan',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),
                              FittedBox(fit:BoxFit.contain,child: Text(this.widget.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),

                ],
                          ),
                          Text("${widget.description}",style: TextStyle(color: Colors.white,fontSize: 15),

                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 5,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: 70,
                                child: FlatButton(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () {},
                                  color: Palette.buttonjColor,
                                  textColor: Colors.white,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text("See More",
                                        style: TextStyle(fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Container(
                                height: 30,
                                width: 70,
                                child: FlatButton (
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                  ),
                                  onPressed:  ()  {
                                   // buyProgram(widget.id, widget.programId);
                                   /*  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Payment(id:widget.id,program: widget.program,password: widget.password,name: widget.name,email: widget.email,)),
                                    ); */

                                  },
                                  color: Palette.buttonjColor,
                                  textColor: Colors.white,
                                  child: FittedBox(
                                    child: Text("Buy",
                                        style: TextStyle(fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex:1
                      ,child: Image.asset(
                    widget.image,
                    fit: BoxFit.fill,
                  )),
                ],
              ),
            ),
          )
      );
  }

}


