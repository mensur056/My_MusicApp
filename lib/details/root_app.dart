import 'package:flutter/material.dart';
import 'package:my_musicapp/constants.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: black, bottomNavigationBar: BottomBar(),);
  }

  Widget BottomBar() {
    return Container(height: 80, decoration: BoxDecoration(color: white),);
  }
}