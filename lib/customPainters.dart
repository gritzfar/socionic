import 'package:flutter/material.dart';

class IntuitionIcon extends CustomPainter {
  Color color;

  IntuitionIcon({this.color = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = color;

    // create a path
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    // close the path to form a bounded shape
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class EthicIcon extends CustomPainter {
  Color color;

  EthicIcon({this.color = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = color;

    // create a path
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width / 2, 0);
    path.lineTo(0, 0);
    // close the path to form a bounded shape
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class LogicIcon extends CustomPainter {
  Color color;

  LogicIcon({this.color = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = color;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SensoricIcon extends CustomPainter {
  Color color;

  SensoricIcon({this.color = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = color;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

Widget getIcon(CustomPainter customPainter, double width, double height){
  return Container(
      width: width,
      height: height,
      child: CustomPaint(
        //size: Size(10, 10),
        painter: customPainter,
      ));
}