import 'package:flutter/material.dart';

class BoxDeco {
  static containerBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xff0B42AB),
          Color(0xff134CB5),
          Color(0xff08244F),
        ],
      ),
    );
  }
}
