import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/data/data.dart';
import 'package:flutter_clubhouse_ui/widgets/room_card.dart';
import 'package:flutter_clubhouse_ui/widgets/upcomingRooms.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile.dart';

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
          UserProfile(
            imgageUrl: currentUser.imageUrl,
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: EdgeInsets.all(20),
            children: [
              UpComingRooms(upcomingRooms: upcomingRoomsList),
              SizedBox(height: 10),
              ...roomsList.map(
                (e) => RoomCard(
                  room: e,
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                  Theme.of(context).scaffoldBackgroundColor
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        CupertinoIcons.add,
                        size: 21,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "Start a room",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 40,
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.circle_grid_3x3_fill,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 40,
            bottom: 60,
            child: Container(
              height: 16,
              width: 16,
              decoration:
                  BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            ),
          )
        ],
      ),
    );
  }
}
