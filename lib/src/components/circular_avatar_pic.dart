import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../constants/object_constants.dart';
import '../constants/string_constants.dart';

class AvatarPic extends StatefulWidget {
  final double size;
  const AvatarPic({super.key, required this.size});

  @override
  State<AvatarPic> createState() => _AvatarPicState();
}

class _AvatarPicState extends State<AvatarPic> {
  @override
  void initState() {
    link();
    super.initState();
  }

  link() async {
    final storageRef = FirebaseStorage.instance.ref();
    final imageUrl = await storageRef.child(emailAllTime).getDownloadURL();
    userImage = imageUrl;
    img = NetworkImage(userImage);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.size,
      backgroundImage: img,
    );
  }
}
