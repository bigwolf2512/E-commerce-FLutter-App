import 'package:flutter/cupertino.dart';

extension ObjectExtension on Object? {
  void log() {
    if (this == null) return;
    debugPrint('DEBUG TUNT-----' + toString());
  }
}
