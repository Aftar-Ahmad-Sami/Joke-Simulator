import 'package:flutter/material.dart';

import '../../constants/object_constants.dart';

void snackBarOperation({required String text}) {
  ScaffoldMessenger.of(contex).showSnackBar(SnackBar(content: Text(text)));
}
