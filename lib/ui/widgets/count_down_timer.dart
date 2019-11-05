import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:real_bodies/theme/palette.dart';

class CountDownTimer extends StatefulWidget {

 // CountDownTimer ({Key key/*, this.duration}*/}) : super(key: key);          // Key take holds of state remove it to see if it affects

  final int duration = 0;                                 // define Duration object to get the full duration
                                                    // use widget.duration to access it in the state class

final _CountDownTimerState ct = new _CountDownTimerState();


  @override
  _CountDownTimerState createState() => _CountDownTimerState();

  void startStopTimer(){
   // ct._startStopTimer();
  }
}

class _CountDownTimerState extends State<CountDownTimer>
with TickerProviderStateMixin
{
  AnimationController _floatBtnAnimController;
  bool _isPlaying = false;
  bool _animationCompleted = false;
 AnimationController _animationController;



 String get timerString {
   Duration duration = _animationController.duration * _animationController.value;
   return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
 }


 @override
  void initState() {
    super.initState();
    _floatBtnAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

   _animationController = AnimationController(
       vsync: this,
       duration: Duration(seconds: 5),
   )..addListener(_stopAnimation);
   _animationController.reverse(
       from: _animationController.value == 0.0
           ? 1.0
           : _animationController.value
   );

  }


@override
  void dispose() {
  _floatBtnAnimController.dispose();
  _animationController.dispose();
    super.dispose();
  }

  void _stopAnimation() {
   if(_animationController.isCompleted){
     setState(() {
 _handleOnPressed();
     });
   }
  }

  void _handleOnPressed() {
    setState(() {
      _isPlaying = !_isPlaying;
      _isPlaying
          ? _floatBtnAnimController.forward()
          : _floatBtnAnimController.reverse();
    });

  }


  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return
          Container(
            height: 400,
            width: 400,
            child: Row(
              children:<Widget>[

                Expanded(
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return FloatingActionButton(
                              heroTag: 'startStopbtn',
                              child:
                              AnimatedIcon(icon: AnimatedIcons.play_pause,
                                  progress: _floatBtnAnimController),
                                backgroundColor: Palette.mainPurple,
                        foregroundColor: Colors.white,
                        elevation: 5.0,
                                onPressed: (){


                                _handleOnPressed();
                                if (_animationController.isAnimating)
                                    _animationController.stop();
                                  else {
                                    _animationController.reverse(
                                        from: _animationController.value == 0.0
                                            ? 1.0
                                            : _animationController.value);
                                  }

                                });
//                            return FloatingActionButton.extended(
//                                onPressed: () {
//                                  if (_animationController.isAnimating)
//                                    _animationController.stop();
//                                  else {
//                                    _animationController.reverse(
//                                        from: _animationController.value == 0.0
//                                            ? 1.0
//                                            : _animationController.value);
//                                  }
//                                },
//
//                                icon: Icon(_animationController.isAnimating
//                                    ? Icons.pause
//                                    : Icons.play_arrow),
//                                label: Text(
//                                    _animationController.isAnimating ? "Pause" : "Play"));
                          }),
                    ),
                  ),
                ),


                Expanded(
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Stack(
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: 200,
                          child:
                          AnimatedBuilder(
                            animation: _animationController,
                            builder:
                                (BuildContext context, Widget child) {
                              return CustomPaint(
                                painter: CustomTimerPainter(
                                  animation: _animationController,
                                  backgroundColor: Palette.lightPurple,
                                  color: Palette.mainPurple,
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
                                timerString,
                                style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),




                      ],

              ),
                    ),
                  ),
                ),


            ],
            ),
          );

        }
    );
  }
  }
//}

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
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round
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

