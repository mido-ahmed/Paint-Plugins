import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawing Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _strokes = <Path>[];

  void _startStroke(double x, double y) {
    _strokes.add(Path()..moveTo(x, y));
  }

  void _moveStroke(double x, double y) {
    setState(() {
      _strokes.last.lineTo(x, y);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            var item = _strokes.clear();
          });
        },
        child: Icon(Icons.clear),
        backgroundColor: Colors.teal,
      ),
      appBar: AppBar(
        title: Text('Drawing Flutter'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          GestureDetector(
            onPanDown: (details) => _startStroke(
              details.localPosition.dx,
              details.localPosition.dy,
            ),
            onPanUpdate: (details) => _moveStroke(
              details.localPosition.dx,
              details.localPosition.dy,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CustomPaint(
                painter: DrawingPainter(_strokes),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.teal,
                        child: Text("Undo"),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 45,
                      ),
                      FloatingActionButton(
                          backgroundColor: Colors.teal,
                          child: Text("Redo"),
                          onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Path> strokes;

  DrawingPainter(this.strokes);

  @override
  void paint(Canvas canvas, Size size) {
    for (final stroke in strokes) {
      final paint = Paint()
        ..strokeWidth = 10
        ..color = Colors.black
        ..style = PaintingStyle.stroke;

      canvas.drawPath(stroke, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
