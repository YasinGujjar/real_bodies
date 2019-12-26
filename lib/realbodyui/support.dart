import 'package:flutter/material.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/realbodyui/fitnesslevel2.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_alert_dialog.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';


class Support extends StatefulWidget {
  final int id;
 /*  final String goal;
  final  String name;
    final String email;
    final String password; */
  Support({this.id,});
  //this.goal,this.name,this.email,this.password});
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final TextEditingController _email = new TextEditingController();
    final TextEditingController _support = new TextEditingController();
  CustomTextField _emailField;
  String dietplan = "";
  URL urldomain = URL();
 /*  void setdiet() async {
    try {
      var url = urldomain.domain + "add_dietplan";
      final response = await http
          .get(url + "&id=" + widget.id.toString() + "&dietplan=" + dietplan+ "&d=" + dietplan);
      var jsonResponse = json.decode(response.body);
      var requestresponse = jsonResponse['response'];

      if (requestresponse == "success") {
        print('Added  BMI');
        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                FitnessLevelTwo(id: widget.id)));
      } else if (requestresponse == "error") {
        print("error  BMI");
      }
      // print('Response body:${response.body}');
    } catch (e) {
      print(e);
    }
  }
 */
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print('this is dietplan ${widget.email}');

     _emailField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _email,
      hint: "E-mail Adress",
      inputType: TextInputType.emailAddress,
      colorfield: Colors.white,
      textColor: Colors.black,
      // validator: Validator.validateEmail,
    );
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
       appBar: AppBar(
            backgroundColor: Palette.mainPurple,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Center(child: Text('Shop'),),),
      body: Container(
        height: height,
        width: width,
       // color: Palette.boldTextO,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 9,
              child: ListView(
                children: <Widget>[
                  Container(
                    width: width,
                   // color: Palette.boldTextO,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: height * 0.08,
                        ),
                        Text(
                          "What do you need from us ?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 22.0
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: _emailField,
                        ),
                              Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: Container(
                                  height: 200,
                                  child: Card(
      elevation: 0.0,
     // color: widget.w,
      shape: RoundedRectangleBorder(
        side: BorderSide(color:Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
keyboardType: TextInputType.multiline,
  maxLines: null,
  minLines: 2,
          controller: _support,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Colors.grey,
              fontFamily: "OpenSans",
              fontWeight: FontWeight.w300,

            ),
            border: InputBorder.none,
            hintText: "Enter your Problem",
          ),
        ),
      ),
    ),
                                ),
                              )
                       
                       
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
             //   color: Palette.boldTextO,
                child: Center(
                  child: Container(
                    height: 50,
                    width: width * 0.80,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        //setdiet();
                        if(_email.text=="" && _support.text=="")
                        {
                           showDialog(context: context,
builder: (BuildContext context) {
  return CustomAlertDialog(title: "Alert!",content: "Must Fill Fields",);
});
                          print("Select must");
                        }
                        else
                        {
//print("diet plan"+dietplan+"id diet"+widget.id.toString());
                        /*   Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                FitnessLevelTwo(id: widget.id,goal:widget.goal,diet:dietplan,name:widget.name,email:widget.email,password:widget.password)));
                        */ }
                      },
                      color: Palette.mainPurple,
                      textColor: Colors.white,
                      child: Text("Send".toUpperCase(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
