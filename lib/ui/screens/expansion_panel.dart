import 'package:flutter/material.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/realbodyui/bmi_creen.dart';
import 'package:real_bodies/theme/palette.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



@visibleForTesting
enum Gender {
  Male,
  Female,
  
}

typedef DemoItemBodyBuilder<T> = Widget Function(DemoItem<T> item);
typedef DemoItemBodyBuilder2<T> = Widget Function(DemoItem2<T> item2);
typedef ValueToString<T> = String Function(T value);

class DualHeaderWithHint extends StatelessWidget {
 
  const DualHeaderWithHint({
    this.name,
    this.value,
    this.hint,
    this.showHint,
  });

  final String name;
  final String value;
  final String hint;
  final bool showHint;

  Widget _crossFade(Widget first, Widget second, bool isExpanded) {
    return AnimatedCrossFade(
      firstChild: first,
      secondChild: second,
      firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
      secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
      sizeCurve: Curves.fastOutSlowIn,
      crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 200),
    );
  }

 

  @override
  Widget build(BuildContext context) {
    
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
          //  color: Colors.yellow,
            margin: const EdgeInsets.only(left: 24.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                style: textTheme.body1.copyWith(fontSize: 15.0),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.only(left: 24.0),
            child: _crossFade(
              Text(value, style: textTheme.caption.copyWith(fontSize: 15.0)),
              Text(hint, style: textTheme.caption.copyWith(fontSize: 15.0)),
              showHint,
            ),
          ),
        ),
      ],
    );
  }
}

class CollapsibleBody extends StatelessWidget {
  const CollapsibleBody({
    this.margin = EdgeInsets.zero,
    this.child,
    this.onSave,
    this.onCancel,
  });

  final EdgeInsets margin;
  final Widget child;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            bottom: 24.0,
          ) - margin,
          child: Center(
            child: DefaultTextStyle(
              style: textTheme.caption.copyWith(fontSize: 15.0),
              child: child,
            ),
          ),
        ),
        const Divider(height: 1.0),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: FlatButton(
                  onPressed: onCancel,
                  child: const Text('CANCEL', style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  )),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: FlatButton(
                  onPressed: onSave,
                  textTheme: ButtonTextTheme.accent,
                  child: const Text('SAVE'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DemoItem<T> {
  DemoItem({
    this.name,
    this.value,
   // this .value2,
    this.hint,
    this.builder,
    this.valueToString,
  }) : textController = TextEditingController(text: valueToString(value)); //textController2 = TextEditingController(text: valueToString(value2));

  final String name;
  final String hint;
  final TextEditingController textController;
 // final TextEditingController textController2;
  final DemoItemBodyBuilder<T> builder;
  final ValueToString<T> valueToString;
  T value;
 // T value2;
  bool isExpanded = false;

  ExpansionPanelHeaderBuilder get headerBuilder {
    return (BuildContext context, bool isExpanded) {
      return DualHeaderWithHint(
        name: name,
        value: valueToString(value),
        hint: hint,
        showHint: isExpanded,
      );
    };
  }

  Widget build() => builder(this);
}
//height demo

class DemoItem2<T> {
  DemoItem2({
    this.name,
    this.value,
    this .value2,
    this.hint,
    this.builder,
    this.valueToString,
  }) : textController = TextEditingController(text: valueToString(value)+" "+valueToString(value2)); //textController2 = TextEditingController(text: valueToString(value2));

  final String name;
  final String hint;
  final TextEditingController textController;
 // final TextEditingController textController2;
  final DemoItemBodyBuilder2<T> builder;
  final ValueToString<T> valueToString;
  T value;
  T value2;
  bool isExpanded = false;

  ExpansionPanelHeaderBuilder get headerBuilder {
    return (BuildContext context, bool isExpanded) {
      return DualHeaderWithHint(
        name: name,
        value: valueToString(value),
        hint: hint,
        showHint: isExpanded,
      );
    };
  }

  Widget build() => builder(this);
}


class ExpansionPanelsDemo extends StatefulWidget {
  static const String routeName = '/material/expansion_panels';
      int id;
  ExpansionPanelsDemo({this.id});
 /*  String height="";
  String weight="";
  String old="";
  String gender=""; */
  
  //DualHeaderWithHint({@required this.height,@required this.weight,@required this.old,@required this.gender});
// ExpansionPanelsDemo({@required this.height,@required this.weight,@required this.old,@required this.gender});

  @override
  _ExpansionPanelsDemoState createState() => _ExpansionPanelsDemoState();
}

class _ExpansionPanelsDemoState extends State<ExpansionPanelsDemo> {
  List<DemoItem<dynamic>> _demoItems;
  String firstval="";
   int weight;
   double height;
   String bmi="";
  TextEditingController textControllerval;
  TextEditingController textControllerval2;

 URL urldomain =URL();

  void setbmi()async {

    try{
         
      var url=urldomain.domain+"add_bmi";
     final response =await http.get(url+"&id="+widget.id.toString()+"&goal="+bmi);
      var jsonResponse = json.decode(response.body);
      var requestresponse=jsonResponse['response'];

      if (requestresponse=="success"){
        print('Added  BMI');
      }
      else if(requestresponse=="error")
      {

        print("error  BMI");
      }
      // print('Response body:${response.body}');
    }catch(e){
      print(e);
    }
  }


  @override

  Gender checkgender(String gender)
  {if(gender=="male")
  {
    return Gender.Male;
  }
  if(gender=="female")
  {
    return Gender.Female;
  }
return null;
  }

  void initState() {
    super.initState();

    _demoItems = <DemoItem<dynamic>>[
      DemoItem<String>(
        name: 'Age',
        value: "0",
        
        hint: 'Enter new value',
        valueToString: (String value) => value,
        builder: (DemoItem<String> item) {
          void close() {
            setState(() {
              item.isExpanded = false;
            });
          }

          return Form(
            child: Builder(
              builder: (BuildContext context) {
                return CollapsibleBody(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  onSave: () { Form.of(context).save(); close(); },
                  onCancel: () { Form.of(context).reset(); close(); },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: item.textController,
                      decoration: InputDecoration(
                        hintText: item.hint,
                        labelText: item.name,
                      ),
                      onSaved: (String value) { 
                        item.value = value; 
                      
                        },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      DemoItem<Gender>(
        name: 'Gender',
        value: Gender.Male,
        
        hint: 'Select Gender',
        valueToString: (Gender gender) => gender.toString().split('.')[1],
        builder: (DemoItem<Gender> item) {
          void close() {
            setState(() {
              item.isExpanded = false;
            });
          }
          return Form(
            child: Builder(
              builder: (BuildContext context) {
                return CollapsibleBody(
                  onSave: () { Form.of(context).save(); close(); },
                  onCancel: () { Form.of(context).reset(); close(); },
                  child: FormField<Gender>(
                    initialValue: item.value,
                    onSaved: (Gender result) { item.value = result; },
                    builder: (FormFieldState<Gender> field) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RadioListTile<Gender>(
                            value: Gender.Male,
                            title: const Text('Male'),
                            groupValue: field.value,
                            onChanged: field.didChange,
                          ),
                          RadioListTile<Gender>(
                            value: Gender.Female,
                            title: const Text('Female'),
                            groupValue: field.value,
                            onChanged: field.didChange,
                          ),
                         
                        ],
                      );
                    },
                  ),
                );
              }
            ),
          );
        },
      ),
      DemoItem<String>(
        name: 'Weight',
        value: "",
        
        hint: 'Enter new value',
        valueToString: (String value) => value,
        builder: (DemoItem<String> item) {
          void close() {
            setState(() {
              item.isExpanded = false;
            });
          }

          return Form(
            child: Builder(
              builder: (BuildContext context) {
                return CollapsibleBody(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  onSave: () { Form.of(context).save(); close(); },
                  onCancel: () { Form.of(context).reset(); close(); },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: item.textController,
                      decoration: InputDecoration(
                        hintText: item.hint,
                        labelText: item.name,
                      ),
                      onSaved: (String value) { 
                        item.value = value+" Kg"; 
                        int val = int.parse(value);
                        weight=val;
                        },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      DemoItem<String>(
        name: 'Height',
        value: "0",
     // value2: '11',
   
        hint: 'Enter new value',
        valueToString: (String value) => value,
        builder: (DemoItem<String> item) {
          void close() {
            setState(() {
              item.isExpanded = false;
            });
          }

          return Form(
            child: Builder(
              builder: (BuildContext context) {
                return CollapsibleBody(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  onSave: () { Form.of(context).save(); close(); },
                  onCancel: () { Form.of(context).reset(); close(); },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: TextFormField(
                            
                            controller:textControllerval,
                            decoration: InputDecoration(
                              hintText: item.hint,
                              labelText: "Foot",
                            ),
                            onChanged: (String value){
//firstval=textControllerval.toString();
                            print(value);
                            setState(() {
                              firstval=value;
print(value);
                            });
                            },
                           // onSaved: (String value) { item.value = value; },
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Container(
                          width: 100,
                          child: TextFormField(
                            controller: textControllerval2,
                            decoration: InputDecoration(
                              hintText: item.hint,
                              labelText: "Inch",
                            ),
                            onSaved: (String value) { 
                              item.value = firstval+"Ft. "+value+ "In.";
                              double one = double.parse(firstval);
                             double two = double.parse(value);
                              height=one*0.3048+two*0.0254;
                              print(item.value); },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      /* appBar: AppBar(
        title: const Text('Expansion panels'),
        actions: <Widget>[
        //  MaterialDemoDocumentationButton(ExpansionPanelsDemo.routeName),
        ],
      ), */
    //  color: Palette.mainPurple,
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: SafeArea(
              top: false,
              bottom: false,
              child: Container(
                margin: const EdgeInsets.all(24.0),
                child: ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _demoItems[index].isExpanded = !isExpanded;
                    });
                  },
                  children: _demoItems.map<ExpansionPanel>((DemoItem<dynamic> item) {
                    return ExpansionPanel(
                      isExpanded: item.isExpanded,
                      headerBuilder: item.headerBuilder,
                      body: item.build(),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
           Container(
                      //margin: EdgeInsets.only(top: 5.0),
                      height: 50,
                      width: 350,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
double heightsuqare=height*height;
                          double bmival=weight/heightsuqare;
                          bmi=bmival.toStringAsFixed(2);
                          setbmi();
                            Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Bmi(bmi:bmi)));
                        },
                        color: Colors.white,
                        textColor: Palette.backGround,
                        child: Text("Almost there !".toUpperCase(),
                            style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
        ],
      ),
    );
  }
}