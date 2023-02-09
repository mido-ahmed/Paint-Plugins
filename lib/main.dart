import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:session9/Paint_plugins/CustomPaintOne.dart';

void main() {
  runApp(MyApp());
}

const Color kCanvasColor = Color(0xfff2f3f7);
const String kGithubRepo = 'https://github.com/JideGuru/flutter_drawing_board';

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Let\'s Draw',
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: CustomPainterShapes(),
        ));
  }
}
