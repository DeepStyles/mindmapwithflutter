import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mindmapwithflutter/source_widget.dart';
import 'package:widget_arrows/widget_arrows.dart';

class ArrowTest extends StatefulWidget {
  ArrowTest({Key key}) : super(key: key);

  @override
  _ArrowTestState createState() => _ArrowTestState();
}

class _ArrowTestState extends State<ArrowTest> {
  // bool showArrows = true;
  // Offset sourceOffset = Offset.zero;
  final GlobalKey gKey = GlobalKey();
  final GlobalKey gKey1 = GlobalKey();
  // final GlobalKey gKey2 = GlobalKey();

  // final GlobalKey gKey3 = GlobalKey();

// Container(key: key,...); //add key to your widget, which position you need to find

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) => setPos());
  }

  // setPos() {
  //   RenderBox box = gKey.currentContext.findRenderObject();
  //   Offset position = box.localToGlobal(Offset.zero);
  //   print('position:$position '); //this is global posssition
  //   // setState(() {
  //   sourceOffset = position;
  //   // });
  // }

  @override
  Widget build(BuildContext context) => ArrowContainer(
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Stack(
              children: <Widget>[
                SourceWidget(
                  alignment: Alignment.center,
                  title: 'C',
                  targetTitle: 'C1',
                  key: gKey,
                ),

                SourceWidget(
                  alignment: Alignment.centerRight,

                  title: 'C1',
                  key: gKey1,
                  // targetTitle: 'C2',
                ),

                // Align(
                //   // key: gKey2,
                //   alignment: Alignment.center,
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Colors.amber,
                //         borderRadius: BorderRadius.circular(20)),
                //     // color: Colors.amber,
                //     width: 100,
                //     height: 100,
                //     child: ArrowElement(
                //       color: Colors.greenAccent,
                //       // show: showArrows,
                //       id: 'text2',
                //       // targetId: 'text1',
                //       targetIdList: ['text1', 'text3'],
                //       sourceAnchor: Alignment.topCenter,

                //       targetAnchor: Alignment.center,
                //       child: Center(
                //         child: Text(
                //           'C1',
                //           // style: Theme.of(context).textTheme.headline4,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Align(
                //   // key: gKey1,
                //   alignment: Alignment.topRight,
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Colors.amber,
                //         borderRadius: BorderRadius.circular(20)),
                //     // color: Colors.amber,
                //     width: 100,
                //     height: 100,
                //     child: ArrowElement(
                //       color: Colors.yellowAccent,
                //       // show: showArrows,
                //       id: 'text1',
                //       // targetId: 'text',
                //       sourceAnchor: Alignment.center,

                //       targetAnchor: Alignment.center,
                //       child: Center(
                //         child: Text(
                //           'C2',
                //           // style: Theme.of(context).textTheme.headline4,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Align(
                //   // key: gKey3,
                //   alignment: Alignment.bottomRight,
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Colors.amber,
                //         borderRadius: BorderRadius.circular(20)),
                //     // color: Colors.amber,
                //     width: 100,
                //     height: 100,
                //     child: ArrowElement(
                //       color: Colors.yellowAccent,
                //       // show: showArrows,
                //       id: 'text3',
                //       // targetId: 'text',
                //       sourceAnchor: Alignment.centerRight,
                //       // targetAnchor: Alignment.center,
                //       child: Center(
                //         child: Text(
                //           'C3',
                //           // style: Theme.of(context).textTheme.headline4,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
}

// import 'package:flutter/material.dart';
// import 'package:widget_arrows/widget_arrows.dart';

// // void main() => runApp(MyApp());

// class ArrowTest extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Directionality(
//         textDirection: TextDirection.ltr,
//         child: ArrowContainer(
//           child: MaterialApp(
//             home: HomePage(),
//           ),
//         ),
//       );
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: Stack(
//           children: [
//             Center(
//               child: Draggable(
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.red,
//                   child: Text('Drag me'),
//                 ),
//                 feedback: ArrowElement(
//                   id: 'feedback',
//                   targetId: 'target',
//                   sourceAnchor: Alignment.center,
//                   bow: 0,
//                   child:
//                       Container(height: 100, width: 100, color: Colors.orange),
//                 ),
//               ),
//             ),
//             DragTarget<String>(
//               builder: (context, candidateData, rejectedData) => ArrowElement(
//                 id: 'target',
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.green,
//                   child: Center(
//                     child: Text(
//                       'Drag target',
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
// }

// // import 'package:flutter/material.dart';
// // import 'package:widget_arrows/widget_arrows.dart';

// // class ArrowTest extends StatefulWidget {
// //   ArrowTest({Key key}) : super(key: key);

// //   @override
// //   _ArrowTestState createState() => _ArrowTestState();
// // }

// // class _ArrowTestState extends State<ArrowTest> {
// //   bool showArrows = true;

// //   @override
// //   Widget build(BuildContext context) => ArrowContainer(
// //         child: Scaffold(
// //           appBar: AppBar(
// //             title: ArrowElement(
// //               show: showArrows,
// //               color: Colors.red,
// //               id: 'title',
// //               targetId: 'text2',
// //               targetAnchor: Alignment.topCenter,
// //               sourceAnchor: Alignment.bottomCenter,
// //               child: Text('Arrows everywhere'),
// //             ),
// //           ),
// //           body: Center(
// //             child: Column(
// //               mainAxisSize: MainAxisSize.max,
// //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// //               children: <Widget>[
// //                 Align(
// //                   alignment: Alignment.centerLeft,
// //                   child: ArrowElement(
// //                     show: showArrows,
// //                     id: 'text',
// //                     targetId: 'fab',
// //                     sourceAnchor: Alignment.bottomCenter,
// //                     color: Colors.green,
// //                     child: Text('Arrows and stuff'),
// //                   ),
// //                 ),
// //                 Align(
// //                   alignment: Alignment.centerRight,
// //                   child: ArrowElement(
// //                     show: showArrows,
// //                     id: 'text2',
// //                     targetId: 'text',
// //                     targetAnchor: Alignment.centerRight,
// //                     child: Text(
// //                       'Arrow here please',
// //                       style: Theme.of(context).textTheme.headline4,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           floatingActionButton: ArrowElement(
// //             id: 'fab',
// //             child: FloatingActionButton(
// //               onPressed: () => setState(() {
// //                 showArrows = !showArrows;
// //               }),
// //               tooltip: 'hide/show',
// //               child: Icon(Icons.remove_red_eye),
// //             ),
// //           ),
// //         ),
// //       );
// // }
