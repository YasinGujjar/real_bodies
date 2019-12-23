import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';
 class Payment extends StatefulWidget {
   @override
   _PaymentState createState() => _PaymentState();
 }
 
 class _PaymentState extends State<Payment> {
   final TextEditingController _card = new TextEditingController();
   final TextEditingController _cardExpiry = new TextEditingController();
   final TextEditingController _cvv = new TextEditingController();

   CustomTextField _cardField;
   CustomTextField _cardExpiryField;
   CustomTextField _cvvField;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cardField = new CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _card,
      hint: "Card Expiry",
      inputType: TextInputType.emailAddress,
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
      hint: "Password",
      colorfield: Palette.backGround,
      textColor: Colors.white,
      // validator: Validator.validatePassword,
    );

    _cvvField = CustomTextField(
      baseColor: Colors.white,
      borderColor: Colors.grey,
      errorColor: Colors.red,
      controller: _cvv,
      obscureText: true,
      hint: "CVV",
      colorfield: Palette.backGround,
      textColor: Colors.white,
      // validator: Validator.validatePassword,
    );

  }

   @override
   Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
     double height = MediaQuery.of(context).size.height;
     return Scaffold(
       body: Container(
         color: Palette.backGround,
         child: Column(
           children: <Widget>[
             SizedBox(height: height *0.05,),
             Container(
                height: height * 0.05,
                 child: Center(child: FittedBox(fit:BoxFit.contain,child: Text('You Are Buying',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)))),


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
                                      Text('sumeeer', style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),),
                                    ],
                                  ),
                                  Text('ghjgjg', style: TextStyle(
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
                 height: height * 0.20,
                 child: AutoSizeText('Your Plan will be charged 9000\$', style: TextStyle(
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
               child: _cardField,
             ),
             Container(
               child: _cardExpiryField,
             ),
             Container(
               child: _cvvField,
             ),
           ],
         ),
       ),


     );
   }
 }