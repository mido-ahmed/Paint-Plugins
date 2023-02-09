import 'package:flutter/material.dart';

class Image_Painter extends StatefulWidget {
  const Image_Painter({Key? key}) : super(key: key);

  @override
  State<Image_Painter> createState() => _Image_PainterState();
}

class _Image_PainterState extends State<Image_Painter> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePanter(),
      child: Container(),
    );
  }
}

class LinePanter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;
    //draw line
    Offset p1 = Offset(0.0, size.height / 3);
    Offset p2 = Offset(size.width, size.height / 3);
    canvas.drawLine(p1, p2, paint);
    //draw circle
    Offset c = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(c, 60.0, paint);
    //draw rectangle
    Offset center = Offset(size.width / 4.5, size.height / 4.5);
    Rect rect = Rect.fromCircle(center: center, radius: 80.0);
    canvas.drawRect(rect, paint);
    //draw triangle
    Path path = Path();
    path.moveTo(size.width / 2, size.height / 3);
    path.lineTo(80.0, 400.0);
    path.lineTo(size.width - 80.0, 400);
    path.close();
    canvas.drawPath(path, paint);
    //draw curve
    var pathh = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(0.0, 200)
      ..quadraticBezierTo(size.width / 2, 250.0, size.width, 200)
      ..lineTo(size.width, 0.0)
      ..close();

    canvas.drawPath(pathh, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
    //tells custom painter if u wanted to refresh like repaints
    return false;
  }
}
