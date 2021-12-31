import 'package:flutter/material.dart';
import 'package:my_musicapp/constants.dart';

class AlbumPage extends StatefulWidget {
  final dynamic song;

  const AlbumPage({this.song});

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 220,decoration: BoxDecoration(color: Colors.red
              ),
              )
            ],
          )
        ],
      ),
    );
  }
}
