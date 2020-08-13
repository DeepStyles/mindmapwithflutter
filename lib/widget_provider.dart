import 'package:flutter/widgets.dart';
import 'package:mindmapwithflutter/source_widget.dart';

class WidgetProvider extends ChangeNotifier {
  Map<String, Nueron> allBoxes;
  // int widgetCount;
  // List<Offset> offsets = [];
  List<SourceWidget> widgetList;
  Map<String, Offset> allOffsets;
  String titleEntered;
  String titleEDesc;
  // Map<String, Offset> listofOffsets;
  // Offset currentOffset;
  String currentSelectedTitle;
  WidgetProvider() {
    allBoxes = {};
    widgetList = [];
    allOffsets = {};

    // widgetCount = 0;
    // currentOffset = Offset.zero,
    currentSelectedTitle = 'root';
    addWidget('root', '', null);
  }

  addWidget(String title, String titleDesc, TextEditingController cont) {
    if (allBoxes.isEmpty) {
      allBoxes[title] = Nueron(title, titleDesc ?? '', '');
      // allBoxes[title].targetIdList = [];
      widgetList.add(SourceWidget(
        // alignment: Alignment.center,
        title: title,
        targetListTitle: [],
      ));
      print('addedroot: ${allBoxes['root'].targetIdList}');
    } else {
      if (!allBoxes.containsKey(title)) {
        // allBoxes.forEach((k, v) {
        // if () {
        allBoxes[title] = Nueron(title, titleDesc ?? '', '');
        allBoxes[title].targetIdList = [];
        // print('current title: $currentSelectedTitle');

        allBoxes[currentSelectedTitle].targetIdList.add(title);
        print('addedroot: ${allBoxes[currentSelectedTitle].targetIdList}');

        widgetList.add(SourceWidget(
          // alignment: Alignment.center,
          title: title,
          targetListTitle: [],
        ));
        cont.clear();
      }
    }

    notifyListeners();
  }

  setCurrentTitle(String s) {
    if (currentSelectedTitle != s) {
      currentSelectedTitle = s;
      print('current selected: $currentSelectedTitle');

      notifyListeners();
    }
  }

  setOffset(Offset o, String title) {
    allOffsets['title'] = o;
  }
}

class Nueron {
  // Offset currentOffset;
  String title = '';
  String description = '';
  List<String> targetIdList = [];

  Nueron(String title, String titledesc, String targetId) {
    this.title = title;
    // this.currentOffset = offset;s
    this.description = titledesc;
    // this.targetIdList.add(targetId);
  }

  // List<Widget> sourceWidgetList;
}
