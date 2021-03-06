import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
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

  AudioPlayer? advancedPlayer;
  AudioCache? audioCache;
  bool isPlaying = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    playSound(widget.songUrl);
  }

  playSound(localPath) async {
    await audioCache!.play(localPath);
  }

  stopSound(localPath) async {
    Uri audioFile = await audioCache!.load(localPath);
    await advancedPlayer!.setUrl(audioFile.path);
    advancedPlayer!.stop();
  }

  seekSound() async {
    Uri audioFile = await audioCache!.load(widget.songUrl);
    await advancedPlayer!.setUrl(audioFile.path);
    advancedPlayer!.seek(Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stopSound(widget.songUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
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
              height: 50,
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
                seekSound();
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
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  '4:60',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shuffle,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                IconButton(
                  iconSize: 50,
                  onPressed: () {
                    if (isPlaying) {
                      stopSound(widget.songUrl);
                      setState(() {
                        isPlaying=false;
                      });
                    }else{playSound(widget.songUrl);
                    setState(() {
                      isPlaying=true;
                    });}
                  },
                  icon: Container(
                    decoration:
                        BoxDecoration(color: primary, shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                       isPlaying? Icons.stop: Icons.play_arrow,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.repeat_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.tv,
                color: primary,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Chromecast is ready',
                style: TextStyle(color: primary),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
