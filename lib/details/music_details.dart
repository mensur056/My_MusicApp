import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
