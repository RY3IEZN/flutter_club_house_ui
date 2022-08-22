import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile.dart';

import '../data/data.dart';
import '../widgets/room_user_profile.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({Key? key, required this.room}) : super(key: key);

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0E4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF0F0E4),
        leadingWidth: 120,
        leading: TextButton.icon(
          style: TextButton.styleFrom(primary: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            CupertinoIcons.chevron_down,
            color: Colors.black,
          ),
          label: Text("All rooms"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.doc,
              size: 28,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserProfile(
                imgageUrl: currentUser.imageUrl,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        room.club,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 17),
                      ),
                      Icon(CupertinoIcons.ellipsis)
                    ],
                  ),
                  Text(
                    room.name,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                children: room.speakers
                    .map(
                      (e) => RoomUserProfile(
                        imageUrl: e.imageUrl,
                        name: e.givenName,
                        isNew: Random().nextBool(),
                        isMuted: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            ),
            // folllowers
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Followed by Speakers",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w700)),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
                children: room.followedBySpeakers
                    .map(
                      (e) => RoomUserProfile(
                        imageUrl: e.imageUrl,
                        name: e.givenName,
                        isNew: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            ),
            // others
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Others in the room",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w700)),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
                children: room.others
                    .map(
                      (e) => RoomUserProfile(
                        imageUrl: e.imageUrl,
                        name: e.givenName,
                        isNew: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 100))
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(24)),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "✌",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                        text: "Leave quietly",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300], shape: BoxShape.circle),
                    child: Icon(
                      CupertinoIcons.add,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300], shape: BoxShape.circle),
                    child: Icon(
                      CupertinoIcons.hand_raised,
                      size: 30,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
