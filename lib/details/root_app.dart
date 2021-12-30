import 'package:flutter/material.dart';
import 'package:my_musicapp/constants.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      bottomNavigationBar: BottomBar(),
      body: GetBody(),
    );
  }

  Widget GetBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        Center(
          child: Text(
            'Home',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),Center(
          child: Text(
            'Book',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),Center(
          child: Text(
            'Search',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),Center(
          child: Text(
            'Settings',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        )
      ],
    );
  }

  Widget BottomBar() {
    List items = [Icons.home, Icons.book, Icons.search, Icons.settings];
    return Container(
      height: 80,
      decoration: BoxDecoration(color: black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(
                onPressed: () {
                  setState(() {
                    activeTab = index;
                  });
                },
                icon: Icon(
                  items[index],
                  color: activeTab == index ? primary : white,
                ));
          }),
        ),
      ),
    );
  }
}
