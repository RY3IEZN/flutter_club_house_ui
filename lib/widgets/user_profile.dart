import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key, required this.imgageUrl, this.size = 70})
      : super(key: key);

  final String imgageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2 - size / 18),
      child: Image.network(imgageUrl,
          height: size, width: size, fit: BoxFit.cover),
    );
  }
}
