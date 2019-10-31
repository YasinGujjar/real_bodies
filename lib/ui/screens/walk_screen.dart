import 'package:flutter/material.dart';
import "package:flutter_swiper/flutter_swiper.dart";
import 'package:real_bodies/models/walkthrough.dart';
import 'package:real_bodies/ui/widgets/custom_flat_button.dart';
//import 'package:shared_preferences/shared_preferences.dart';


class WalkthroughScreen extends StatefulWidget {
 // final SharedPreferences prefs;
  final List<Walkthrough> pages = [
  Walkthrough(
      icon: Icons.fitness_center,
      title: "What's your gaol?",
      description:
          "Select one",
          extraWidget: Container(
child: Column( children: <Widget>[
  Padding(
    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
      child: Card(
                elevation: 10.0,
                child: new InkWell(
                  splashColor: Colors.blue,
    onTap: () {
      print("tapped");
    },
    child: Container(
      child: ListTile(
                    title: Text('     Lose Weight',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w800),),
                   subtitle: Text('       Burn fat & get lean'),
                    /* leading:
                        const Icon(Icons.), */
                  ),
    ),
  ),
                
              ),
  ),
  Padding(
    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
      child: Card(
               
                 elevation: 10.0,
                child: new InkWell(
                  splashColor: Colors.blue,
    onTap: () {
      print("tapped");
    },
    child: Container(
                child: ListTile(
                    title: Text('     Get Fitter',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w800),),
                   subtitle: Text('       Tone up & feel healthy'),
                    /* leading:
                        const Icon(Icons.), */
                  ),
    ),
                ),
              ),
  ),
  Padding(
    padding: const EdgeInsets.only(left:15.0,right: 15.0),
      child: Card(
                elevation: 10.0,
                child: new InkWell(
                  splashColor: Colors.blue,
    onTap: () {
      print("tapped");
    },
    child: Container(
                child: ListTile(
                    title: Text('     Gain Muscle',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w800),),
                   subtitle: Text('       Build mass & Strenght'),
                    /* leading:
                        const Icon(Icons.), */
                  ),
    ),),
              ),
  ),
],),
          )
    ),
  Walkthrough(
    icon: Icons.pregnant_woman,
    title: "What's your gender?",
    description: "Select",
    extraWidget: Container(
child: Align(
  alignment: Alignment.topCenter,
  child:   Row( children: <Widget>[
    
    Padding(
      padding: const EdgeInsets.only(left: 0.0,right: 0.0),
        child: Card(
                  elevation: 10.0,
                  
                  child: new InkWell(
                    splashColor: Colors.blue,
      onTap: () {
        print("tapped");
      },
      child: Container(
        width: 120.0,
        height: 120.0,
        child: ListTile(
                      title: Text('Male',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w800),),
                   
                      /* leading:
                          const Icon(Icons.), */
                    ),
      ),
    ),
                  
                ),
    ),
     Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 0.0),
        child: Card(
                 
                   elevation: 10.0,
                  child: new InkWell(
                    splashColor: Colors.blue,
      onTap: () {
        print("tapped");
      },
      child: Container(
        width: 120.0,
        height: 120.0,
                  child: ListTile(
                      title: Text('Female',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w800),),
                     subtitle: Text(' '),
                      /* leading:
                          const Icon(Icons.), */
                    ),
      ),
                  ),
                ),
    ), 
    
  ],),
),
          )

  ),
  Walkthrough(
    icon: Icons.account_circle,
    title: "Step 3",
    description:
        "How old are you?",
  ),
   Walkthrough(
    icon: Icons.account_circle,
    title: "Step 4",
    description:
        "How tall are you?",
  ),
   Walkthrough(
    icon: Icons.account_circle,
    title: "Step 5",
    description:
        "How much do you weight ?",
  ),
  ];

 // WalkthroughScreen({this.prefs});

  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Swiper.children(
        autoplay: false,
        index: 0,
        loop: false,
        pagination: new SwiperPagination(
          margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
          builder: new DotSwiperPaginationBuilder(
              color: Colors.white30,
              activeColor: Colors.white,
              size: 6.5,
              activeSize: 8.0),
        ),
        control: SwiperControl(
          iconPrevious: null,
          iconNext: null,
        ),
        children: _getPages(context),
      ),
    );
  }

  List<Widget> _getPages(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Widget> widgets = [];
    for (int i = 0; i < widget.pages.length; i++) {
      Walkthrough page = widget.pages[i];
      widgets.add(
        new Container(
          color: Color.fromRGBO(15, 120, 212, 1.0),
          child: ListView(
            children: <Widget>[
              Container(
              
                height: height * 0.35,
                child: Column(
                  children: <Widget>[
Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  page.icon,
                  size: 125.0,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
                child: Text(
                  page.title,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: "OpenSans",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  page.description,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                    fontFamily: "OpenSans",
                  ),
                ),
              ),
                  ],
                ),
              ),
              
              Container(
                 color: Colors.blueGrey,
                 height: height * 0.45,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: page.extraWidget,
                ),
              )
            ],
          ),
        ),
      );
    }
    widgets.add(
      new Container(
        color: Color.fromRGBO(212, 20, 15, 1.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.code,
                size: 125.0,
                color: Colors.white,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 50.0, right: 15.0, left: 15.0),
                child: Text(
                  "Jump straight into the action.",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: "OpenSans",
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0),
                child: CustomFlatButton(
                  title: "Get Started",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  onPressed: () {
                   // widget.prefs.setBool('seen', true);
                   // Navigator.of(context).pushNamed("/root");
                  },
                  splashColor: Colors.black12,
                  borderColor: Colors.white,
                  borderWidth: 2,
                  color: Color.fromRGBO(212, 20, 15, 1.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return widgets;
  }
}
