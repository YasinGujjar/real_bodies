import 'package:flutter/material.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/realbodyui/fitnesslevel2.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_alert_dialog.dart';


class DietPlan extends StatefulWidget {
  final int id;
  final String goal;
  final  String name;
    final String email;
    final String password;
  DietPlan({this.id,this.goal,this.name,this.email,this.password});
  @override
  _DietPlanState createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
  Color colorkito = Palette.boldTextO;
  Color colorveg = Palette.boldTextO;
  Color colorgluten = Palette.boldTextO;
  Color colordairy = Palette.boldTextO;
  Color colormass = Palette.boldTextO;
  Color colormap = Palette.boldTextO;
  Color colorpaleo = Palette.boldTextO;
  Color colorgeneral = Palette.boldTextO;
  Color colorpref = Palette.boldTextO;
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
    print('this is dietplan ${widget.email}');
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Palette.boldTextO,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 9,
              child: ListView(
                children: <Widget>[
                  Container(
                    width: width,
                    color: Palette.boldTextO,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Text(
                          "Diet Goals",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Text(
                          "Do You Prefer a Specific Diet ?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          width: width * 0.9,
                          // color: Colors.orange,
                          child: FlatButton(
                            color: colorkito,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                "Kito",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "OpenSans",
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                dietplan="Kito";
                                colorkito = Colors.orange;
                                colorveg = Palette.boldTextO;
                                colorgluten = Palette.boldTextO;
                                colordairy = Palette.boldTextO;
                                colormass = Palette.boldTextO;
                                colormap = Palette.boldTextO;
                                colorpaleo = Palette.boldTextO;
                                colorgeneral = Palette.boldTextO;
                                colorpref = Palette.boldTextO;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: width * 0.9,
                          // color: Colors.orange,
                          child: FlatButton(
                            color: colorveg,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                "Veg",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "OpenSans",
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                dietplan="Veg";
                                colorkito = Palette.boldTextO;
                                colorveg = Colors.orange;
                                colorgluten = Palette.boldTextO;
                                colordairy = Palette.boldTextO;
                                colormass = Palette.boldTextO;
                                colormap = Palette.boldTextO;
                                colorpaleo = Palette.boldTextO;
                                colorgeneral = Palette.boldTextO;
                                colorpref = Palette.boldTextO;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: width * 0.9,
                          // color: Colors.orange,
                          child: FlatButton(
                            color: colorgluten,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                "Gluten Free",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "OpenSans",
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                dietplan="Gluten free";
                                colorkito = Palette.boldTextO;
                                colorveg = Palette.boldTextO;
                                colorgluten = Colors.orange;
                                colordairy = Palette.boldTextO;
                                colormass = Palette.boldTextO;
                                colormap = Palette.boldTextO;
                                colorpaleo = Palette.boldTextO;
                                colorgeneral = Palette.boldTextO;
                                colorpref = Palette.boldTextO;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: width * 0.9,
                          // color: Colors.orange,
                          child: FlatButton(
                            color: colordairy,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                "Dairy Free",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "OpenSans",
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                dietplan="Dairy free";
                                colorkito = Palette.boldTextO;
                                colorveg = Palette.boldTextO;
                                colorgluten = Palette.boldTextO;
                                colordairy = Colors.orange;
                                colormass = Palette.boldTextO;
                                colormap = Palette.boldTextO;
                                colorpaleo = Palette.boldTextO;
                                colorgeneral = Palette.boldTextO;
                                colorpref = Palette.boldTextO;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: width * 0.9,
                          // color: Colors.orange,
                          child: FlatButton(
                            color: colormass,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                "Mass Gainer",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "OpenSans",
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                dietplan="Mass Gainer";
                                colorkito = Palette.boldTextO;
                                colorveg = Palette.boldTextO;
                                colorgluten = Palette.boldTextO;
                                colordairy = Palette.boldTextO;
                                colormass = Colors.orange;
                                colormap = Palette.boldTextO;
                                colorpaleo = Palette.boldTextO;
                                colorgeneral = Palette.boldTextO;
                                colorpref = Palette.boldTextO;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: width * 0.9,
                          // color: Colors.orange,
                          child: FlatButton(
                            color: colormap,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                "FodMap",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "OpenSans",
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                dietplan="FodMap";
                                colorkito = Palette.boldTextO;
                                colorveg = Palette.boldTextO;
                                colorgluten = Palette.boldTextO;
                                colordairy = Palette.boldTextO;
                                colormass = Palette.boldTextO;
                                colormap = Colors.orange;
                                colorpaleo = Palette.boldTextO;
                                colorgeneral = Palette.boldTextO;
                                colorpref = Palette.boldTextO;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: width * 0.9,
                          // color: Colors.orange,
                          child: FlatButton(
                            color: colorpaleo,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                "Paleo",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "OpenSans",
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                dietplan="Paleo";
                                colorkito = Palette.boldTextO;
                                colorveg = Palette.boldTextO;
                                colorgluten = Palette.boldTextO;
                                colordairy = Palette.boldTextO;
                                colormass = Palette.boldTextO;
                                colormap = Palette.boldTextO;
                                colorpaleo = Colors.orange;
                                colorgeneral = Palette.boldTextO;
                                colorpref = Palette.boldTextO;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: width * 0.9,
                          // color: Colors.orange,
                          child: FlatButton(
                            color: colorgeneral,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                "General",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "OpenSans",
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                dietplan="General";
                                colorkito = Palette.boldTextO;
                                colorveg = Palette.boldTextO;
                                colorgluten = Palette.boldTextO;
                                colordairy = Palette.boldTextO;
                                colormass = Palette.boldTextO;
                                colormap = Palette.boldTextO;
                                colorpaleo = Palette.boldTextO;
                                colorgeneral = Colors.orange;
                                colorpref = Palette.boldTextO;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: width * 0.9,
                          // color: Colors.orange,
                          child: FlatButton(
                            color: colorpref,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                "No Prefrences",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "OpenSans",
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                dietplan="No Prefrences";
                                colorkito = Palette.boldTextO;
                                colorveg = Palette.boldTextO;
                                colorgluten = Palette.boldTextO;
                                colordairy = Palette.boldTextO;
                                colormass = Palette.boldTextO;
                                colormap = Palette.boldTextO;
                                colorpaleo = Palette.boldTextO;
                                colorgeneral = Palette.boldTextO;
                                colorpref = Colors.orange;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Palette.boldTextO,
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
                        if(dietplan=="")
                        {
                           showDialog(context: context,
builder: (BuildContext context) {
  return CustomAlertDialog(title: "Alert!",content: "Must Select Plan",);
});
                          print("Select must");
                        }
                        else
                        {
print("diet plan"+dietplan+"id diet"+widget.id.toString());
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                FitnessLevelTwo(id: widget.id,goal:widget.goal,diet:dietplan,name:widget.name,email:widget.email,password:widget.password)));
                        }
                      },
                      color: Palette.mainPurple,
                      textColor: Colors.white,
                      child: Text("Next".toUpperCase(),
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
