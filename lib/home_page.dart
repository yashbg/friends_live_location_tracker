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

  @override
  void initState(){
    this.checkAuthentication();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
