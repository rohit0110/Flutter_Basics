import 'package:flutter/material.dart';
import 'package:sample_project/pages/choose_location.dart';
import 'package:sample_project/pages/home.dart';
import 'package:sample_project/pages/loading.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/home', routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  }));
}
