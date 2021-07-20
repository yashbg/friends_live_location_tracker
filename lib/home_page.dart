import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'start.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isLoggedIn = false;
  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Start(),
            ));
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser!;
    await firebaseUser.reload();
    firebaseUser = _auth.currentUser!;
    setState(() {
      this.user = firebaseUser;
      this.isLoggedIn = true;
    });
  }

  signOut() async {
    _auth.signOut();
  }

  @override
  void initState() {
    this.checkAuthentication();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: !isLoggedIn
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    child: Image(
                      image: AssetImage('assets/welcome'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Hello ${user.displayName}, you are logged in as ${user.email}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: signOut,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
