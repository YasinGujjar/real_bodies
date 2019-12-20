
import 'package:flutter/material.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';
import 'package:real_bodies/ui/widgets/newcarousel.dart';
import 'package:real_bodies/ui/widgets/weight_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';



class ShowWeight extends StatefulWidget {
  final int id;
  final String weight;
  final List imgList;
  final List weightList;

ShowWeight({this.id,this.weight,this.imgList,this.weightList});
  @override
  _ShowWeightState createState() => _ShowWeightState();
}

class _ShowWeightState extends State<ShowWeight> {
  static final String uploadEndPoint=URL.urlmain+"upload_image";
   final TextEditingController _newweight = new TextEditingController();
  final TextEditingController _img = new TextEditingController();
 CustomTextField _weightField;
  CustomTextField _imageField;
 Color add=Palette.mainPurple;
 Color my =Colors.grey;
  bool addWeight=false;
  List imgList=[];
 URL urldomain =URL();
 String status='';
 Future<File> file;
 String base64Image; 
 File tempFile;
 String errormsg="Error Uploading";


 chooseimg(){
   setState(() {
     
   });
file=ImagePicker.pickImage(source: ImageSource.gallery);
 }
 setStatus(String msg)
 {
   setState(() {
     status=msg;
   });
 }

 startupload(){
   setStatus("Uploading Image...");
if(null==tempFile)
{
  setStatus(errormsg);
return;
}
String filename=tempFile.path.split('/').last;
upload(filename);
 }

 upload(String filename){
   print("uuuuuuuuuuuuuuuuuuuuuuuuuuu"+filename+"kkkk"+_newweight.text);
http.post(uploadEndPoint,body: {
  "id":widget.id.toString(),
  "image": base64Image,
  "name": filename,
  "weight":_newweight.text,
  "date": DateTime.now().toString()
}).then((result){
  print(result.body);
  setStatus(result.statusCode==200 ? result.body: errormsg);
}).catchError((error){
  setStatus(error);
});
 }

 Widget showimage(){
   return FutureBuilder<File>(
     future: file,
     builder: (BuildContext context, AsyncSnapshot<File> snapshot)
     {
       if(snapshot.connectionState==ConnectionState.done && null!=snapshot.data)
       {
         tempFile=snapshot.data;
         base64Image=base64Encode(snapshot.data.readAsBytesSync());
         return Container(
           height: 200,
            width: MediaQuery.of(context).size.width*0.5,
           child: Image.file(snapshot.data,fit:BoxFit.fill,),
         );
       }
       else if(null!=snapshot.error)
       {
         return const Text("Error picking img");
       }
       else
       {
         return const Text("No Image Selected");
       }
     },
   );
 }

 /* checkinfo() async
  {
   try
   {
      print("id weight"+widget.id.toString());
    //  print(DateTime.now().toString());
       var url=urldomain.domain+"get_weight_record";
    final response=await http.get(url+"&id="+widget.id.toString());
    print('Response body:${response.body}');
   var jsonResponse=json.decode(response.body);
 for(int i=0; i<jsonResponse.length; i++){
 imgList.add(URL.imageUrl+jsonResponse[i]['image']);
 }
print(imgList);
//return imgList;
   }
   catch(e)
   {
     print("Exception on way $e");
   }
  } */
  Widget _addweight()
  {return Container(
    //color: Colors.blue,
    width: 200,
    height: 200,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          _weightField,
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              showimage(),
              SizedBox(width: 30.0,),
              OutlineButton(
                onPressed: chooseimg,
                child: Text("Choose Image"),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
           /*  SizedBox(
            height: 40.0,
          ), */
          Text(status,textAlign: TextAlign.center,style: TextStyle(color: Colors.green)),
          Container(
            width: 200,
            child: FlatButton(
                       //color: Palette.mainPurple,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            "Add Weight",
                            softWrap: true,
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
                        onPressed: () {
                          startupload();
                        },
                      ),
          ),
        ],
      ),
    ),
  );

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("iiiiiiiiiiiiiiiiiii"+widget.imgList.toString());
    //checkinfo();
     _weightField = new CustomTextField(
      baseColor: Colors.grey,
       borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _newweight,
      hint: "Add New Weight",
      //validator: Validator.validateName,
    );
    /*  _imageField = new CustomTextField(
      baseColor: Colors.grey,
       borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _newweight,
      hint: "Add Image",
      //validator: Validator.validateName,
    ); */
    
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
       appBar: AppBar(
          backgroundColor: Palette.mainPurple,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Center(
            child: Text(
              "Check Your Proccess"
             
            ),
          ),
        ),
          body: ListView(children: <Widget>[
      Container(
        width:width ,
        height:height* 0.15,
        //color: Colors.blue,
        child: Column(
          children: <Widget>[
           
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                 
                  
                  Container(
                    width: width*0.3,
                    child: FlatButton(
                     //color: Palette.mainPurple,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Add Weight",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: add,
                            decoration: TextDecoration.none,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                          color: add,
                          width: 2,
                        ),
                      ),
                      onPressed: () {
setState(() {
  addWeight=true;
  add=Colors.grey;
  my=Palette.mainPurple;
});
                      },
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(left:12.0),
                     child: Container(
                       width: width*0.3,
                       child: FlatButton(
                       //color: Palette.mainPurple,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            "My Weight",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:my,
                              decoration: TextDecoration.none,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              fontFamily: "OpenSans",
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(
                            color: my,
                            width: 2,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
  addWeight=false;
  add=Palette.mainPurple;
  my=Colors.grey;
});
                        },
                  ),
                     ),
                   ),

                ],
              ),
            ),
            Text("Add more Photos to control your process",style: TextStyle(fontWeight: FontWeight.w600),)
          ],
        ),
      ),
      
            Container(
              height: height*0.55,
               
            //  color: Colors.yellow,
 child:
 addWeight ? _addweight() : Column(
   mainAxisSize: MainAxisSize.max ,
   children: <Widget>[
     CarouselDemo(id:widget.id,img :widget.imgList,weight: widget.weightList,),
             
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Your weight progress",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21.0),
                                  )),   
   ],
 ),
             ),
               Container(
              height: height*0.25,
             // color: Colors.blue,
               child:Padding(
                  padding: const EdgeInsets.only(left:20.0,right: 20.0),
                  child: Card(
                    elevation: 5.0,
                                      child: Container(
                      
                        // height: 250.0,
                         width: width,
                        // color: Palette.greyBackground,
                           
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: WeightChart(),
                                ),
                              
                            

                        ),
                  ),
                ),
             )
      
  ]),
    );
  }
/*   _buildCard( String imgPath, ) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            
          },
          child: Stack(
            children: <Widget>[
              Container(
                height: 215.0,
                width: 200.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.cover)),
              ),
              //make the shade a bit deeper.
              Container(
                height: 215.0,
                width: 200.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),),
                   // color: Colors.black.withOpacity(0.4)),
              ),
              Positioned(
                top: 10.0,
                left: 10.0,
                child: Row(
                  children: <Widget>[
                  
                   
                  ],
                ),
              ),
             
             
            ],
          ),
        ));
  } */
  
}