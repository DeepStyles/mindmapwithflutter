import 'package:flutter/material.dart';
import 'package:mindmapwithflutter/dragprovider.dart';
import 'package:provider/provider.dart';

class DragTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final coffset = Provider.of(context,lsiten)
    return Consumer<DragProvider>(
      builder: (_, dragProv, child) {
        return Transform.translate(
          offset: dragProv.curOffset,
          child: GestureDetector(
            onPanUpdate: (updateDet) {
              dragProv.updateOffset(updateDet);
            },
            child: Container(width: 100, height: 100, color: Colors.redAccent),
          ),
        );
      },
    );
  }
}
