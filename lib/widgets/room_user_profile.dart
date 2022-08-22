import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile.dart';

class RoomUserProfile extends StatelessWidget {
  const RoomUserProfile(
      {Key? key,
      required this.imageUrl,
      required this.name,
      this.size = 70.0,
      this.isNew = false,
      this.isMuted = false})
      : super(key: key);

  final String imageUrl;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: UserProfile(imgageUrl: imageUrl),
            ),
            if (isNew)
              (Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 2),
                          blurRadius: 5.0)
                    ],
                  ),
                  child: Text("🎉"),
                ),
              )),
            if (isMuted)
              (Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 2),
                          blurRadius: 5.0)
                    ],
                  ),
                  child: Icon(CupertinoIcons.mic_slash_fill),
                ),
              ))
          ],
        ),
        Flexible(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
