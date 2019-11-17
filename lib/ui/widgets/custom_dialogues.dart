import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_bodies/pages/food_details.dart';

class FoodDialogue extends StatefulWidget {

  @override
  _FoodDialogueState createState() => _FoodDialogueState();
}

class _FoodDialogueState extends State<FoodDialogue> {
     final textController = TextEditingController();
     String initialValue;
  @override

  @override
  void dispose() {
    // TODO: implement dispose
    textController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   // var serving = FoodValues.of(context).servings;
    final foodDetailState = FoodValues.of(context).foodDetailsState;
    initialValue = '${foodDetailState.servingQuantity}';
    textController.text = initialValue;
    textController.selection = new TextSelection(baseOffset: 0, extentOffset: initialValue.length);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: Container(
        child: Row(
          children: <Widget>[
            Text('Serving'),
            Container(
              width: 20,
              child: TextField(
                controller: textController,
                keyboardType: TextInputType.number,
                autofocus: true,

              ),
            ),

            FlatButton(child: Text('Okay'),
            onPressed: (){
              Navigator.of(context).pop();
              foodDetailState.setQuantity(textController.text);


            },)
          ],
        ),
      ),
    );
  }
}
