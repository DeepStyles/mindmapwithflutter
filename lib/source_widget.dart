import 'package:mindmapwithflutter/offset_provider.dart';
import 'package:mindmapwithflutter/widget_provider.dart';
import 'package:provider/provider.dart';
import 'package:widget_arrows/widget_arrows.dart';
import 'package:flutter/material.dart';

class SourceWidget extends StatefulWidget {
  SourceWidget({
    Key key,
    // sourceWidgets,
    @required this.title,
    this.targetTitle,
    this.targetListTitle,
    this.description,
    // this.gkey,
    // this.alignment,
  }) :
        // targetTitle = targetTitle ?? '',
        super(key: key);
  // final Alignment alignment;
  // final GlobalKey gkey;
  final String title;
  final String targetTitle;
  final List<String> targetListTitle;

  final String description;

  @override
  _SourceWidgetState createState() => _SourceWidgetState();
}

class _SourceWidgetState extends State<SourceWidget> {
  // List<Widget> sourceWidgets;
  Offset sourceOffset;
  final GlobalKey gKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    sourceOffset = Offset.zero;
    // sourceWidgets = [];
    WidgetsBinding.instance.addPostFrameCallback((_) => setPos());
  }

  setPos() {
    RenderBox box = gKey.currentContext.findRenderObject();
    Offset position = box.localToGlobal(Offset.zero);
    // print('position:$position '); //this is global posssition
    // setState(() {
    sourceOffset = position;
    Provider.of<WidgetProvider>(context, listen: false)
        .allOffsets[widget.title] = sourceOffset;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WidgetProvider>(
      builder: (_, widgetsProvider, child) {
        return Transform.translate(
          offset: sourceOffset,
          // offset: widgetsProvider.allOffsets[widget.title],
          child: GestureDetector(
            key: gKey,
            // onDoubleTap: () {},
            onDoubleTap: () {
              widgetsProvider.setCurrentTitle(widget.title);
            },
            onPanUpdate: (updateDet) {
              setState(() {
                sourceOffset += updateDet.delta;
              });
            },
            onPanEnd: (d) {
              widgetsProvider.setOffset(sourceOffset, widget.title);
            },
            child: Align(
              alignment: Alignment.center,
              child: ArrowElement(
                straights: true,
                padStart: 25,
                padEnd: 25,
                tipLength: 8,
                id: widget.title,
                targetIdList:
                    widgetsProvider.allBoxes[widget.title].targetIdList ?? [],
                sourceAnchor: Alignment.center,
                targetAnchor: Alignment.center,
                color: Colors.green,
                child: Container(
                  decoration: BoxDecoration(
                      color:
                          widgetsProvider.currentSelectedTitle == widget.title
                              ? Colors.green
                              : Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  width: 100,
                  height: 50,
                  child: Center(
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text('${widget.title}'))),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
