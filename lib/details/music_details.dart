import 'package:flutter/material.dart';

import '../constants.dart';

class MusicDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String img;
  final String songUrl;
  final Color color;

  const MusicDetailPage(
      {required this.title,
      required this.description,
      required this.img,
      required this.songUrl,
      required this.color});

  @override
  _MusicDetailPageState createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  double _SliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 70.0, left: 70, top: 30),
                child: Container(
                  width: 360,
                  height: 300,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(color: widget.color, blurRadius: 50)
                  ], borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70.0, left: 70, top: 30),
                child: Container(
                  width: 360,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.img), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Container(
              width: size.width - 80,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          widget.description,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Slider(
              activeColor: primary,
              max: 4.60,
              min: 0,
              value: _SliderValue,
              onChanged: (value) {
                setState(() {
                  _SliderValue = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_SliderValue}',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '4:60',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
