import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mindmapwithflutter/source_widget.dart';
import 'package:mindmapwithflutter/widget_provider.dart';
import 'package:provider/provider.dart';
import 'package:widget_arrows/widget_arrows.dart';

class ArrowTest extends StatefulWidget {
  ArrowTest({Key key}) : super(key: key);

  @override
  _ArrowTestState createState() => _ArrowTestState();
}

class _ArrowTestState extends State<ArrowTest> {
  double scaleFactor = 1;
  TextEditingController cont;
  @override
  void initState() {
    super.initState();
    cont = TextEditingController();
  }

  @override
  void dispose() {
    cont.dispose();
    super.dispose();
  }

  setScale(double f) {
    if (scaleFactor <= .7) scaleFactor = 0.7;
    if (scaleFactor >= 1) scaleFactor = 1;

    setState(() {
      scaleFactor += f;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild home widget...');
    return ArrowContainer(
      child: Material(
        child: Consumer<WidgetProvider>(
          builder: (_, widgetProvider, child) {
            return Padding(
              padding: const EdgeInsets.all(28.0),
              child: Stack(
                // fit: StackFit.expand,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () {
                        if (cont.text.isNotEmpty) {
                          widgetProvider.addWidget(cont.text, '', cont);
                        } else {
                          print('text is empty...');
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your Title',
                      ),
                      controller: cont,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 80,
                      height: 150,
                      child: Column(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setScale(0.1);
                            },
                            child: Icon(Icons.arrow_drop_up),
                            mini: true,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setScale(-0.1);
                            },
                            child: Icon(Icons.arrow_drop_down),
                            mini: true,
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Transform.scale(
                      scale: scaleFactor,
                      child: Stack(
                        children: [
                          ...widgetProvider.widgetList,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
