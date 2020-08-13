import 'package:flutter/cupertino.dart';

class OffsetProvider extends ChangeNotifier {
  Map<String, Offset> mapOffset;

  OffsetProvider() : mapOffset = {};

  addOffsettolist(Offset o, String title) {
    mapOffset[title] = o;
  }
}
