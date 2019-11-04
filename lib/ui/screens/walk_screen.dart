import 'package:flutter/material.dart';
import "package:flutter_swiper/flutter_swiper.dart";
import 'package:real_bodies/models/walkthrough.dart';
import 'package:real_bodies/theme/my_flutter_app_icons.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/screens/welcome_screen.dart';
import 'package:real_bodies/ui/widgets/category_item.dart';
import 'package:real_bodies/ui/widgets/custom_flat_button.dart';
import 'package:real_bodies/ui/widgets/info_text_field.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class WalkthroughScreen extends StatefulWidget {
  // final SharedPreferences prefs;
  
 
  static TextEditingController _infooldcontroller = new TextEditingController();
  static TextEditingController _infoftcontroller = new TextEditingController();
  static TextEditingController _infoincontroller = new TextEditingController();
  static TextEditingController _infoweightcontroller = new TextEditingController();
  //InfoTextField _info;

  final List<Walkthrough> pages = [
    Walkthrough(
        icon: Icons.fitness_center,
        title: "What's your gaol?",
        description: "Select one",
        extraWidget: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  elevation: 10.0,
                  child: new InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
                      print("tapped");
                    },
                    child: Container(
                      child: ListTile(
                        title: Text(
                          '     Lose Weight',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text('       Burn fat & get lean'),
                        /* leading:
                        const Icon(Icons.), */
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  elevation: 10.0,
                  child: new InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
                      print("tapped");
                    },
                    child: Container(
                      child: ListTile(
                        title: Text(
                          '     Get Fitter',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text('       Tone up & feel healthy'),
                        /* leading:
                        const Icon(Icons.), */
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  elevation: 10.0,
                  child: new InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
                      print("tapped");
                    },
                    child: Container(
                      child: ListTile(
                        title: Text(
                          '     Gain Muscle',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text('       Build mass & Strenght'),
                        /* leading:
                        const Icon(Icons.), */
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
    Walkthrough(
        icon: Icons.person,
        title: "What's your gender?",
        description: "Select",
        extraWidget: Container(
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                CategoryItem(name: 'Male',icon: MyFlutterApp.male,onPressed: () {
                  print("Hoo gyaaaaa");
                } ),
                CategoryItem(name: 'Female',icon: MyFlutterApp.female,onPressed: () {
                  print("Hoo gyaaaaa");
                } ),
              ],
            ),
          ),
        )),
    Walkthrough(
        icon: Icons.person,
        title: "How old are you?",
        description: "Type Age",
        extraWidget: Container(
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[InfoTextField(postfix: "CM",controller:_infooldcontroller ,)],
            ),
          ),
        )),
    Walkthrough(
      icon: Icons.person,
      title: "How tall are you?",
      description: "In Ft.",
      extraWidget:  Container(
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[InfoTextField(postfix: "CM",controller:_infoftcontroller ,),Padding(
                padding: const EdgeInsets.all(6.0),
              ),
             InfoTextField(postfix: "CM",controller:_infoincontroller ,)
              ],

            ),
          ),
        )
    ),
    Walkthrough(
      icon: Icons.person,
      title: "How much do you weight ?",
      description: "In Kg",
      extraWidget:  Container(
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[InfoTextField(postfix: "CM",controller:_infoweightcontroller ,)],
            ),
          ),
        )
    ),
  ];

  // WalkthroughScreen({this.prefs});

  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final TextEditingController _infocontroller = new TextEditingController();
  InfoTextField _info;
  @override
  void initState() {
    super.initState();
    _info = new InfoTextField(
      controller: _infocontroller,
    );
  }

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
          color: Palette.mainPurple,
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
                      padding: const EdgeInsets.only(
                          top: 10.0, right: 15.0, left: 15.0),
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
                // color: Colors.blueGrey,
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
        color: Palette.mainPurple,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.get_app,
                size: 125.0,
                color: Colors.white,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 50.0, right: 15.0, left: 15.0),
                child: Text(
                  "Welcome to Fitness App",
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
                     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => WelcomeScreen()),
  );
                  },
                  splashColor: Colors.black12,
                  borderColor: Colors.white,
                  borderWidth: 2,
                  color: Color.fromRGBO(58, 15, 157, 1.0),
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



