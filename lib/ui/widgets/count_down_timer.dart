import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:intl/intl.dart';

import 'package:real_bodies/theme/palette.dart';

const alarmAudioPath = "sound/timeup.mp3"; 
const beepAudioPath = "sound/beep.mp3";
const oneSec = const Duration(seconds:1);
const interval = const Duration(seconds :5);


class CountDownTimer extends StatefulWidget {

 // CountDownTimer ({Key key/*, this.duration}*/}) : super(key: key);          // Key take holds of state remove it to see if it affects

  final int duration = 0;   
                                // define Duration object to get the full duration
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
 DateTime duration = new DateTime.fromMicrosecondsSinceEpoch(interval.inMicroseconds);
  DateFormat minutesSeconds = new DateFormat("ms");
 Timer counterSeconds;
  AnimationController _floatBtnAnimController;
  bool _isPlaying = false;
  bool _animationCompleted = false;
 AnimationController _animationController;
static AudioCache player = new AudioCache();


 String get timerString {
   Duration duration = _animationController.duration * _animationController.value ;

 //DateTime duration1 = new DateTime.fromMillisecondsSinceEpoch(duration.inSeconds);
 //print("hjvjdfbsdhbfjsjbjhbjsbfjhgvbsfjbvjs"+duration1.toString());
 /* if(duration.toString()=="3"){
   player.play(beepAudioPath);
 } */
   if (_animationController.value == 0.0){
      player.play(alarmAudioPath);
      //print('lololololololololololololololo'+duration.inSeconds.toString());

   }
  /*  if(duration.inMicroseconds<=200000)
   {
     player.play(alarmAudioPath);
   } */
   return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  // return '$duration1';
 }


 @override
  void initState() {
    super.initState();
      // _actionTimer();

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
  
   /* _animationController.addStatusListener((status){
if (status == AnimationStatus.completed)
{
  setState(() {
     player.play(alarmAudioPath);

  });
 }
   }); */

  }


@override
  void dispose() {
  _floatBtnAnimController.dispose();
  _animationController.dispose();
    super.dispose();
  }

  void _stopAnimation() {
  
   if(_animationController.isCompleted){
  //  player.play(alarmAudioPath);
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

  void handleTick() {
    print(duration);
    setState(() {
      duration = duration.subtract(oneSec);
      if (duration.second == 3) {
        player.play(beepAudioPath);
      //  stopTimer();
      }
      if (duration.second == 2) {
        player.play(beepAudioPath);
       
      }
      if (duration.second == 1) {
        player.play(beepAudioPath);
        
      }
      if (duration.second == 0) {
        player.play(alarmAudioPath);
        stopTimer();
      }
      

    });
  }

  void _actionTimer() {
    if (counterSeconds == null) {
      startTimer();
    } else if (counterSeconds.isActive){
      stopTimer();
    } else {
      startTimer();
    }
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
                                if  (_animationController.isAnimating)
                                  {
                                   
                                      _animationController.stop();
                                   //  stopTimer();
                                }
                                  else {
                                                                //              startTimer();
                                   // sleep(Duration(milliseconds: 1000));
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
                         // Text('${minutesSeconds.format(duration)}'),

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
   void startTimer() {
    if (duration.millisecondsSinceEpoch == 0) {
      duration = new DateTime.fromMicrosecondsSinceEpoch(interval.inMicroseconds);
    }
    counterSeconds = new Timer.periodic(oneSec, (Timer t) => handleTick());
     }

  void stopTimer() {
    counterSeconds.cancel();
  

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

