import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile.dart';

import '../data/data.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({Key? key, required this.room}) : super(key: key);

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                room.club,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                room.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 40,
                            top: 20,
                            child: UserProfile(
                                imgageUrl: room.speakers[1].imageUrl),
                          ),
                          UserProfile(
                            imgageUrl: room.speakers[0].imageUrl,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...room.speakers.map(
                            (e) => Text("${e.givenName} ${e.familyName} 🔊")),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      " ${room.speakers.length + room.followedBySpeakers.length + room.others.length}"),
                              WidgetSpan(
                                child: Icon(
                                  CupertinoIcons.person_fill,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              TextSpan(text: " / ${room.speakers.length} "),
                              WidgetSpan(
                                child: Icon(
                                  CupertinoIcons.chat_bubble_fill,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
