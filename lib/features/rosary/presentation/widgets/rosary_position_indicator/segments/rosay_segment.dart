import 'package:flutter/material.dart';

abstract interface class RosarySegment {
  Widget build(BuildContext context);

  int get currentGlobalPosition;

  int get segmentPosition;

  static int globalPosition(int segmentPosition) {
    switch (segmentPosition) {
      case 1:
        return 5;
      case 2:
        return 16;
      case 3:
        return 27;
      case 4:
        return 38;
      case 5:
        return 49;
      default:
        throw Exception('no rosary segment');
    }
  }
}
