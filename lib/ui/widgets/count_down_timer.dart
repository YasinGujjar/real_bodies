import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:real_bodies/theme/palette.dart';

class CountDownTimer extends StatefulWidget {

 // CountDownTimer ({Key key/*, this.duration}*/}) : super(key: key);          // Key take holds of state remove it to see if it affects

  int duration = 0;                                 // define Duration object to get the full duration
                                                    // use widget.duration to access it in the state class




  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
with TickerProviderStateMixin
{

 AnimationController _animationController;

 @override
  void initState() {
    super.initState();

   _animationController = AnimationController(
       vsync: this,
       duration: Duration(seconds: 5),
   );

   _animationController.repeat();
  }


  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: <Widget>[
           Container(
            height: 200,
            width: 200,
            child:
            AnimatedBuilder(
              animation: _animationController,
              builder:
              (BuildContext context, Widget child)
        {
            return CustomPaint(
              painter: CustomTimerPainter(
                animation: _animationController,
                backgroundColor: Colors.cyan,
                color: Palette.orange,
              ),
            );
        },
        ),
        ),


            Positioned.fill(
              child: Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "0:00",
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black),
                  ),
                ),
              ),
            ),


      ],

    );
  }
}

//class for painting

class CustomTimerPainter extends CustomPainter{
  CustomTimerPainter ({
    this.animation,
    this.backgroundColor,
    this.color
}) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;


  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);

  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }

}


