import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'login.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  navigateToLogin() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 35.0),
            Container(
              height: 350,
              child: Image(
                image: AssetImage('assets/start.jpg'),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20.0),
            RichText(
              text: TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "FLLT",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ]),
            ),
            SizedBox(height: 10.0),
            Text(
              "Track your Friends' Live Location!",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: navigateToLogin,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                  ),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
