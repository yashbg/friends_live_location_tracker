import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Friends' Live Location Tracker"),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Welcome to the app!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Clicked');
          },
          child: Text('click'),
        ),
      ),
    ));
