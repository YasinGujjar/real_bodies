import 'dart:convert';
import 'dart:math';
import 'package:real_bodies/models/jsons.dart';
import 'package:flutter/material.dart';
import 'package:real_bodies/models/program.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/realbodyui/payment_done.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:http/http.dart' as http;

 class Payment extends StatefulWidget {
   final ProgramPlan program;

   final String name;
   final String calorie;
   final String email;
   final String password;
   final int id;



   Payment({this.program,
     this.name,
     this.calorie,
     this.email,
     this.password,
     this.id,
   });
   @override
   _PaymentState createState() => _PaymentState();
 }
 
 class _PaymentState extends State<Payment> {


   String argName = "";
   String argPassword="";
   String argUserName="";
   bool press = false;

   ExpiryCard expir = ExpiryCard();
   bool tick = false;
   final TextEditingController _card = new TextEditingController();
   final TextEditingController _cardExpiry = new TextEditingController();
   final TextEditingController _cvv = new TextEditingController();

   CustomTextField _cardField;
   CustomTextField _cardExpiryField;
   CustomTextField _cvvField;



   int paymentAmount;

   Token _paymentToken;
   PaymentMethod _paymentMethod;
   String _error;
   final String _currentSecret = null; //set this yourself, e.g using curl
   PaymentIntentResult _paymentIntent;
   Source _source;

   ScrollController _controller = ScrollController();

   final CreditCard testCard = CreditCard(
     number: '4000002760003184',
     expMonth: 12,
     expYear: 21,

   );

   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


   void buyProgram(int id, int programId ) async {
     print(id);
     print(programId);
     URL urldomain = URL();
     var url=urldomain.domain+"buy_program";

     final response =await http.get(url+"&id="+id.toString()+"&program_id="+programId.toString());

     if (response.statusCode == 200) {
       // If the call to the server was successful, parse the JSON.
       // r Post.fromJson(json.decode(response.body));

       print('Response body:${response.body}');


       Navigator.of(context)
           .push(MaterialPageRoute(builder: (context) => PaymentDone(name:widget.name,id:widget.id,program: widget.program,calorie:widget.calorie)));
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


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentAmount = int.parse(widget.program.price.toString()+'00');
    _cardField = new CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _card,
      hint: "Card Number",
      inputType: TextInputType.number,
      colorfield: Palette.backGround,
      textColor: Colors.white,
      // validator: Validator.validateEmail,
    );
    _cardExpiryField = CustomTextField(

      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _cardExpiry,
      obscureText: true,
      hint: "Card Expiry",
      colorfield: Palette.backGround,
      textColor: Colors.white,
      inputType: TextInputType.number,
      // validator: Validator.validatePassword,
    );

    _cvvField = CustomTextField(

      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _cvv,
      hint: "CVV",
      colorfield: Palette.backGround,
      textColor: Colors.white,
      inputType: TextInputType.number,

      // validator: Validator.validatePassword,
    );

    StripePayment.setOptions(
        StripeOptions(publishableKey: "pk_test_iMRQDJNfLKdmRX7XmKX3RdlE00F7dLGliI", merchantId: "Test", androidPayMode: 'test'));

  }
   void setError(dynamic error) {
     _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(error.toString())));
     setState(() {
       _error = error.toString();
     });
   }

   showPickerDate(BuildContext context) {
     Picker(
         hideHeader: true,
         adapter: DateTimePickerAdapter(),
         title: Text("Select Data"),
         selectedTextStyle: TextStyle(color: Colors.blue),
         onConfirm: (Picker picker, List value) {
           print((picker.adapter as DateTimePickerAdapter).value);
         }
     ).showDialog(context);
   }

  _showPickerArray(BuildContext context) {
     new Picker(
         adapter: PickerDataAdapter<String>(pickerdata: new JsonDecoder().convert(Jsons.PickerData2), isArray: true),
         hideHeader: true,
         title: new Text("Please Select"),
         onConfirm: (Picker picker, List value) {
           ExpiryCard expiry = ExpiryCard();
           print(value.toString());
           print(picker.getSelectedValues());
           print(picker.getSelectedValues()[0]);
           setState(() {
             expir.month = picker.getSelectedValues()[0];
             expir.year = picker.getSelectedValues()[1];
           });

           print(expiry.year);
           print(expiry.month);

          // values = picker.getSelectedValues();
           //print(values[0]);
//           values.split(" ");
//           print(values[0].toString());

         }
     ).showDialog(context);
   }

   @override
   Widget build(BuildContext context) {

     double width = MediaQuery.of(context).size.width;
     double height = MediaQuery.of(context).size.height;
     return Scaffold(
       body: Container(
         color: Palette.backGround,
         child: ListView(
           children: <Widget>[
             Column(
               children: <Widget>[
                 SizedBox(height: height *0.02,),
                 Container(
                    height: height * 0.04,
                     child: Center(child: FittedBox(fit:BoxFit.contain,child: Text('You Are Buying',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)))),
                 SizedBox(height: height *0.01,),

                          Container(
                            height: height * 0.25,
                            width: width * 0.95,
                            decoration: BoxDecoration(
                              color: Color(0xffF5AF19),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 8.0, left: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text('Workout & Meal Plan',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),
                                          Text('${widget.program.title}', style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),),
                                        ],
                                      ),
                                      Text('${widget.program.description}', style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        maxLines: 3,
                                      ),
                                      Container(),


                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                 SizedBox(height: height * 0.05,),
                 Center(
                   child: Container(
                     width: width * 0.70,
                     height: height * 0.15,
                     child: AutoSizeText('Your will be charged for this plan \$ ${widget.program.price}', style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontSize: 32),
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.center,
                       maxLines: 2,
                     ),
                   ),
                 ),
                 Container(
                   height: height * 0.08,
                   width: width * 0.70,
                   child: _cardField,
                 ),
                 InkWell(
                   onTap: (){

                     _showPickerArray(context);
                     print('yes ${expir.month}');

                     },
                   child: Container(
                     height: height * 0.08,
                     width: width * 0.70,
                     child:
                     Card(
                       elevation: 0.0,
                       color: Palette.backGround,
                       shape: RoundedRectangleBorder(
                         side: BorderSide(color: Colors.grey, width: 1.0),
                         borderRadius: BorderRadius.circular(5.0),
                       ),
                       child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: 10.0),
                         child: Align(
                           alignment: Alignment.centerLeft,
                             child:

                             expir.year!=null?
                             Text('${expir.month} ${expir.year}',style: TextStyle(color: Colors.white,fontSize: 16),):
                          Text('Card Expiry',style: TextStyle(color: Colors.white,fontSize: 16),)
                             ),
                       ),

                     ),
                     ),

                 ),
                 Container(
                   height: height * 0.08,
                   width: width * 0.70,
                   child: _cvvField,
                 ),
                 SizedBox(height: height *0.02,),
                 Container(
                   height: height * 0.04,
                   width: width * 0.70,

                   child: Row(
                     children: <Widget>[
                       Expanded(
                         flex:1,
                         child: Checkbox(
                             activeColor: Colors.white,
                             value: tick,
                             onChanged: (bool value) {
                               setState(() {
                                 tick = value;
                               });
                             }),
                       ),
                       Expanded(
                         flex:9,
                         child: AutoSizeText('Save this card for further purchases',style: TextStyle(color: Colors.white,),
                           overflow: TextOverflow.ellipsis,
                           textAlign: TextAlign.center,
                           maxLines: 2,
                         ),
                       )
                     ],
                   ),
                 ),
                    SizedBox(height: height * 0.02,),
                  Container(
                    height: height * 0.09,
                   width: width * 0.6,
                   // color: Colors.orange,
                   child:
                   FlatButton(
                     color: Palette.mainPurple,
                     child: Padding(
                       padding: const EdgeInsets.symmetric(vertical: 12.0),
                       child: FittedBox(
                         fit: BoxFit.contain,
                         child:
                         press? CircularProgressIndicator():
                         Text(
                           "Buy Now",
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             color: Colors.white,
                             decoration: TextDecoration.none,
                             fontSize: 26,
                             fontWeight: FontWeight.w800,
                             fontFamily: "OpenSans",
                           )
                         ),
                       ),
                     ),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(30.0),
                     ),
                     onPressed: () async{
                       setState(() {
                         press = true;
                       });
                      print("button scope ${widget.id}");
                       buyProgram(widget.id, widget.program.programId);
                       final CreditCard myTestCard = CreditCard(
                         number: _card.text,
                         expMonth: int.parse(expir.month),
                         expYear: int.parse(expir.year),

                       );





                       StripePayment.createPaymentMethod(

                         PaymentMethodRequest(
                           card:  myTestCard,
                         ),
                       ).then((paymentMethod) {
                         _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${paymentMethod.id}')));
                         setState(() {
                           _paymentMethod = paymentMethod;
                         });
                       }).catchError(setError);
                   //     widget.notifyParent();


                     },
                   ),
                 ),


               ],
             ),
           ],
         ),
       ),


     );
   }
 }

 class ExpiryCard{
   String month;
   String year;
   ExpiryCard({this.month,this.year});
 }


Future<bool> saveNamePreference(String name, String password,String userName) async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('name', name);
  pref.setString('password', password);
  pref.setString('userName', userName);
  return true;
}
