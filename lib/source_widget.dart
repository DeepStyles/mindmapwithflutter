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
    this.gkey,
    this.alignment,
  }) :
        // targetTitle = targetTitle ?? '',
        super(key: key);
  final Alignment alignment;
  final GlobalKey gkey;
  final String title;
  final String targetTitle;
  final List<String> targetListTitle;

  final String description;

  @override
  _SourceWidgetState createState() => _SourceWidgetState();
}

class _SourceWidgetState extends State<SourceWidget> {
  List<Widget> sourceWidgets;
  Offset sourceOffset = Offset.zero;
  // final GlobalKey gKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    sourceWidgets = [];
    WidgetsBinding.instance.addPostFrameCallback((_) => setPos());
  }

  setPos() {
    RenderBox box = widget.gkey.currentContext.findRenderObject();
    Offset position = box.localToGlobal(Offset.zero);
    print('position:$position '); //this is global posssition
    // setState(() {
    sourceOffset = position;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      key: widget.gkey,
      alignment: widget.alignment,
      child: GestureDetector(
        onDoubleTap: () {},
        onPanUpdate: (updateDet) {
          setState(() {
            sourceOffset += updateDet.delta;
          });
        },
        onPanEnd: (enddet) {
          setState(() {
            setPos();
          });
        },
        child: Transform.translate(
          offset: sourceOffset,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(20)),
            width: 100,
            height: 100,
            child: ArrowElement(
              // show: showArrows,
              // doubleSided: true,
              bow: 0,
              tipLength: 8,
              straights: false,
              id: widget.title,
              targetId: widget.targetTitle ?? '',

              targetIdList: widget.targetListTitle ?? [],
              sourceAnchor: Alignment.centerRight,
              // targetAnchor: Alignment.centerLeft,
              color: Colors.green,
              child: Center(child: Text('${widget.title}')),
            ),
          ),
        ),
      ),
    );
  }
}
