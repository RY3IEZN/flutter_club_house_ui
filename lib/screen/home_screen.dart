import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0E4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF0F0E4),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.search,
            size: 28,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.envelope_open,
              size: 28,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.calendar,
              size: 28,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bell,
              size: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
