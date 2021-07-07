import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friends' Live Location Tracker"),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: Image.asset('assets/space.jpg'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Clicked');
        },
        child: Text('click'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}
