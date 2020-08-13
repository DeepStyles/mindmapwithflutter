import 'package:flutter/cupertino.dart';

class DragProvider extends ChangeNotifier {
  Offset curOffset;
  DragProvider() : curOffset = Offset.zero;

  setOffset(Offset o) {
    curOffset = o;
    notifyListeners();
  }

  updateOffset(DragUpdateDetails d) {
    curOffset += d.delta;
    notifyListeners();
  }
}
