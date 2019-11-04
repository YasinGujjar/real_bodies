import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/screens/sign_in_screen.dart';
import 'package:real_bodies/ui/screens/sign_up_screen.dart';
import 'package:real_bodies/ui/widgets/custom_flat_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage('assets/images/fit.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child: new ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Icon(
                Icons.phone_iphone,
                color: Palette.mainPurple,
                size: 125.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0, right: 15.0, left: 15.0),
              child: Text(
                "Workout & Nutrition App",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Palette.mainPurple,
                  decoration: TextDecoration.none,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: "OpenSans",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Respect your body. It’s the only one you get.",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: "OpenSans",
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
              child: CustomFlatButton(
                title: "Log In",
                fontSize: 22,
                fontWeight: FontWeight.w700,
                textColor: Colors.white,
                onPressed: () {
                 // Navigator.of(context).pushNamed("/signin");
                  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignInScreen()),
  );
                },
                splashColor: Colors.black12,
                borderColor:Palette.mainPurple,
                borderWidth: 0,
                color: Palette.mainPurple,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
              child: CustomFlatButton(
                title: "Sign Up",
                fontSize: 22,
                fontWeight: FontWeight.w700,
                textColor: Colors.black54,
                onPressed: () {
                 // Navigator.of(context).pushNamed("/signup");
                  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignUpScreen()),
  );
                },
                splashColor: Colors.black12,
                borderColor: Colors.black12,
                borderWidth: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
