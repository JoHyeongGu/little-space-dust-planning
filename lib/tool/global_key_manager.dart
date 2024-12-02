import 'package:flutter/material.dart';

class GlobalKeyManager extends ChangeNotifier {
  final Map<String, GlobalKey> keyList = {};

  void registerKey(String key, GlobalKey globalKey) {
    keyList[key] = globalKey;
  }
}
