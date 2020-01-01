import 'package:flutter/material.dart';

class LoadingDialogue extends StatefulWidget {
  @override
  _LoadingDialogueState createState() => _LoadingDialogueState();
}

class _LoadingDialogueState extends State<LoadingDialogue> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          
                        child:Row(
                          children: <Widget>[
                            Container(
                              height: 100,
                              width: 100,
                              child: Center(child: CircularProgressIndicator())),
                              SizedBox(width: 12,),
                              Text("Loading....",style: TextStyle(fontWeight: FontWeight.w600),)
                          ],
                        ),
                
                );
  }
}