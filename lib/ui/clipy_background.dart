import 'package:flutter/material.dart';

class ClipyBackground extends StatelessWidget {
  const ClipyBackground({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  final double min;
  final double max;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClip(min: min),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: max,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff68d8d6),
              Color(0xffc4fff9),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClip extends CustomClipper<Path> {
  MyClip({required this.min});
  final double min;
  @override
  Path getClip(Size size) {
    Path path = Path();

    final p1Diff = (size.height - min) * .5;
    final bezierStartPoint = Offset(0, size.height - p1Diff);
    final bezierControlPoint = Offset(size.width * .4, size.height);
    final bezierEndPoint = Offset(size.width, min);

    path.lineTo(0, 0);
    path.lineTo(bezierStartPoint.dx, bezierStartPoint.dy);
    path.quadraticBezierTo(
      bezierControlPoint.dx,
      bezierControlPoint.dy,
      bezierEndPoint.dx,
      bezierEndPoint.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
