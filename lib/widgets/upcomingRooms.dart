import 'package:flutter/material.dart';

import '../data/data.dart';

class UpComingRooms extends StatelessWidget {
  const UpComingRooms({Key? key, required this.upcomingRooms})
      : super(key: key);

  final List<Room> upcomingRooms;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffe7e4d3), borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: upcomingRooms
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(e.time),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.club,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(e.name)
                        ],
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
