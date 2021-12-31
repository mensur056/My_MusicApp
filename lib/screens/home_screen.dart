import 'package:flutter/material.dart';
import 'package:my_musicapp/constants.dart';
import 'package:my_musicapp/json/songs_json.dart';
import 'package:my_musicapp/screens/album_screen.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeMenu1 = 0;
  int activeMenu2 = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Icon(Icons.list),
            ],
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20),
                  child: Row(
                    children: List.generate(
                      song_type_1.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                activeMenu1 = index;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  song_type_1[index],
                                  style: TextStyle(
                                      color: activeMenu1 == index
                                          ? primary
                                          : Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                activeMenu1 == index
                                    ? Container(
                                        height: 3,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: primary),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    children: List.generate(
                      songs.length - 5,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      alignment: Alignment.bottomCenter,
                                      child: AlbumPage(
                                        song: songs[index],
                                      ),
                                      type: PageTransitionType.scale));
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 180,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          songs[index]['img'],
                                        ),
                                        fit: BoxFit.cover),
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Text(
                                  songs[index]['title'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Text(
                                    songs[index]['description'],
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  width: 180,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20),
                  child: Row(
                    children: List.generate(
                      song_type_2.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                activeMenu2 = index;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  song_type_2[index],
                                  style: TextStyle(
                                      color: activeMenu2 == index
                                          ? primary
                                          : Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                activeMenu2 == index
                                    ? Container(
                                        height: 3,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: primary),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    children: List.generate(
                      songs.length - 5,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: GestureDetector(
                            onTap: () { Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: AlbumPage(
                                      song: songs[index+5],
                                    ),
                                    type: PageTransitionType.scale));},
                            child: Column(
                              children: [
                                Container(
                                  height: 180,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          songs[index + 5]['img'],
                                        ),
                                        fit: BoxFit.cover),
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Text(
                                  songs[index + 5]['title'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Text(
                                    songs[index + 5]['description'],
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  width: 180,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
