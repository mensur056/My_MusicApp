import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Colors
const cwhite = Color(0xFFEAEBF3);
const cblue = Color(0xFF0A3068);

//icons
const wave = "icons/wave.svg";
const play = "icons/play.svg";
const previous = "icons/previous.svg";
const next = "icons/next.svg";
const back = "icons/back.svg";
const options = "icons/options.svg";
const list = "icons/list.png";
const search = "icons/search.png";
const podcast = "icons/podcast.png";
const home = "icons/home.png";
//images
const button = "images/button.png";
const disk = "images/disk.png";
const albumart = "images/AlbumArt.jpg";
const pop = "images/pop.jpg";
const hiphop = "images/hiphop.jpg";
const heavymetal = "images/heavymetal.jpg";
const country = "images/country.jpg";
const scard = "images/scard.png";
const gcard = "images/gcard.png";
const art1 = "images/Art1.jpg";
const art2 = "images/Art2.jpg";
const art3 = "images/Art3.jpg";
const art4 = "images/Art4.jpg";
const art5 = "images/Art5.jpg";

//ButtonWidget
Widget cbutton(String symbol) {
  return Container(
    padding: EdgeInsets.fromLTRB(25, 25, 20, 20),
    height: 80,
    width: 80,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(button),
      ),
    ),
    child: SvgPicture.asset(symbol,
    ),
  );
}