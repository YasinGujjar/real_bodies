import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
 
class ShopProduct extends StatefulWidget {
  final int id;
  ShopProduct({this.id});
  @override
  _ShopProductState createState() => _ShopProductState();
}

class _ShopProductState extends State<ShopProduct> {
  @override
  Widget build(BuildContext context) {
    return ListView(
children: <Widget>[
  Padding(
  padding: const EdgeInsets.all(18.0),
  child:   Container(child: Text("Product",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25.0),),),
),
           ProgramList(title:"Mini Dumble", description:"Write Description Here",id: widget.id,programId: 1,image: "assets/images/product.png"),
           SizedBox(height: 10,),
           ProgramList(title:"Mini Dumble", description:"Write Description Here",id: widget.id,programId: 1,image: "assets/images/product.png"),
            SizedBox(height: 10,),
           ProgramList(title:"Mini Dumble", description:"Write Description Here",id: widget.id,programId: 1,image: "assets/images/product.png"),

],      
    );
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

