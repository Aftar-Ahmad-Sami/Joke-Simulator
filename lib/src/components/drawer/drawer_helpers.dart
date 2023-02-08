import 'package:flutter/material.dart';

import '../../constants/object_constants.dart';
import '../../views/profile_screen.dart';

void profileTile() {
  Navigator.pop(contex);
  Navigator.push(
    contex,
    MaterialPageRoute(builder: (context) => const ProfileScreen()),
  );
}
