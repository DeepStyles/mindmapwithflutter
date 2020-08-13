import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindmapwithflutter/dragprovider.dart';
import 'package:mindmapwithflutter/offset_provider.dart';
import 'package:mindmapwithflutter/home_widget.dart';
import 'package:mindmapwithflutter/widget_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WidgetProvider>(
          create: (_) => WidgetProvider(),
        ),
        // ChangeNotifierProvider<OffsetProvider>(
        //   create: (_) => OffsetProvider(),
        // ),
        // ChangeNotifierProvider<DragProvider>(
        //   create: (_) => DragProvider(),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ArrowTest(),
      ),
    );

    // );s
  }
}
