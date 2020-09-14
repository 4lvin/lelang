import 'package:flutter/material.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';

class CustomBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 300,
      ),
      painter: CurvePainter(),
    );
  }
}

class CustomBackgroundRegis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 200,
      ),
      painter: CurvePainterRegis(),
    );
  }
}

class CustomBackgroundHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 150,
      ),
      painter: CurvePainterHome(),
    );
  }
}



class CurvePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    var rect = Offset.zero & size;

    path.lineTo(80, 0);
    path.quadraticBezierTo(size.width*0.10, size.height*0.20, size.width*0.25, size.height*0.25);
    path.quadraticBezierTo(size.width*0.55, size.height*0.30, size.width*0.50, size.height*0.40);
    path.quadraticBezierTo(size.width*0.37, size.height*0.65, size.width*0.60, size.height*0.65);
    path.quadraticBezierTo(size.width*0.75, size.height*0.65, size.width*0.75, size.height*0.70);
    path.quadraticBezierTo(size.width*0.72, size.height+30, size.width, size.height*0.80);
    path.lineTo(size.width, 0);
    path.close();



    paint.shader = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topRight,
      colors: colorses.gradient,
    ).createShader(rect);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}

class CurvePainterRegis extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    var rect = Offset.zero & size;

    path.lineTo(80, 0);
    path.quadraticBezierTo(size.width*0.10, size.height*0.20, size.width*0.25, size.height*0.25);
    path.quadraticBezierTo(size.width*0.55, size.height*0.30, size.width*0.50, size.height*0.40);
    path.quadraticBezierTo(size.width*0.37, size.height*0.65, size.width*0.60, size.height*0.65);
    path.quadraticBezierTo(size.width*0.75, size.height*0.65, size.width*0.75, size.height*0.70);
    path.quadraticBezierTo(size.width*0.72, size.height+30, size.width, size.height*0.80);
    path.lineTo(size.width, 0);
    path.close();



    paint.shader = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topRight,
      colors: colorses.gradient,
    ).createShader(rect);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}

class CurvePainterHome extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    var rect = Offset.zero & size;

    path.lineTo(0, size.height *0.75);
    path.quadraticBezierTo(size.width* 0.10, size.height*0.70, size.width*0.17, size.height*0.90);
    path.quadraticBezierTo(size.width*0.20, size.height, size.width*0.25, size.height*0.90);
    path.quadraticBezierTo(size.width*0.40, size.height*0.40, size.width*0.50, size.height*0.70);
    path.quadraticBezierTo(size.width*0.60, size.height*0.85, size.width*0.65, size.height*0.65);
    path.quadraticBezierTo(size.width*0.70, size.height*0.90, size.width, 0);
    path.close();



    paint.shader = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topRight,
      colors: colorses.gradient,
    ).createShader(rect);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}

