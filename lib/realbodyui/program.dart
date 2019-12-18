import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:real_bodies/models/program.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/theme/palette.dart';


class Program extends StatefulWidget {
  final id;
  Program({this.id});
  @override
  _ProgramState createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  Future<List<ProgramPlan>> programList;
  URL urldomain =URL();

  Future<List<ProgramPlan>> fetchProgram()async {
    try{
      print(widget.id);
      var url=urldomain.domain+"fetch_program";
      final response =await http.get(url);
      print('Response body:${response.body}');
      Iterable list = json.decode(response.body);

    List<ProgramPlan> ppl =  list.map((model)=>ProgramPlan.fromJson(model)).toList();

       return ppl;
         //ppl.forEach((f)=>print(f.title));


   //   print(jsonResponse);
//      var requestresponse=jsonResponse['response'];
//
//      if (requestresponse=="success"){
//        print('Added the Goal');
//      }
//      else if(requestresponse=="error")
//      {
//
//        print("error adding goal");
//      }
      // print('Response body:${response.body}');
    }catch(e){
      print(e);
    }
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    programList = fetchProgram();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Palette.backGround,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 5,),
            Center(child: Text('Finalizing',style: TextStyle(color: Colors.white,fontSize: 20),)),
            SizedBox(height: 10,),
            Center(child: Text('Thank You, You have Done it. ',style: TextStyle(color: Colors.white,fontSize: 20),)),
            SizedBox(height: 10,),
            Text("We have all what we wanted. Now let's get a proper plan for you to start acting on your dream body ",style: TextStyle(color: Colors.white,fontSize: 15),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            SizedBox(height: 5,),

             FutureBuilder<List<ProgramPlan>>(
               future: programList,
               builder: (context, snapshot){
                 if(snapshot.hasData){
                   return ListView.builder(
                     shrinkWrap: true,
                     itemCount: snapshot.data.length,
                       itemBuilder: (BuildContext context, int index){
                       return
                                Column(
                                  children: <Widget>[
                               ProgramList(title:snapshot.data[index].title, description: snapshot.data[index].description,id: widget.id,
                               programId: snapshot.data[index].programId,
                               image: snapshot.data[index].image,

                               ),
                               SizedBox(height: 10)
                         ],
                                );
                       }
                   );
                 }
                 else{
                   Center(child: CircularProgressIndicator());
                 }
                 return Center(child: CircularProgressIndicator());
               }
             ),
          ],
        ),
      ),
    );
  }
}

class ProgramList extends StatelessWidget {
  final String title;
  final String description;
  var document;
  final String image;
  final int id;
  final int programId;

  ProgramList({this.title,this.description,this.id,this.programId,this.image,this.document});

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
                              FittedBox(fit:BoxFit.contain,child: Text(this.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),

                ],
                          ),
                          Text("$description",style: TextStyle(color: Colors.white,fontSize: 15),

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
                                child: FlatButton(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                  ),
                                  onPressed:  ()  {
                                    buyProgram(id, programId);
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
                      ,child: Image.network(
                    image,
                  )),
                ],
              ),
            ),
          )
      );
  }
}




void buyProgram(int id, int programId) async {
  URL urldomain = URL();
  var url=urldomain.domain+"buy_program";

  final response =await http.get(url+"&id="+id.toString()+"&program_id="+programId.toString());

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
   // r Post.fromJson(json.decode(response.body));
    print('Response body:${response.body}');

  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}