import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:session9/Paint_plugins/image-painter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomPainterShapes(),
      ),
    );
  }
}
