import 'package:flutter/widgets.dart';
import 'package:mindmapwithflutter/source_widget.dart';

class WidgetProvider extends ChangeNotifier {
  Map<String, Widget> allWidgets;
  String widgetCount;
  WidgetProvider()
      : allWidgets = {},
        widgetCount = '';

  addWidget(SourceWidget widget) {
    allWidgets['widgetCount'] = widget;
    widgetCount = (int.parse(widgetCount) + 1).toString();
  }
}
