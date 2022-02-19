import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //AppBar
          SliverPersistentHeader(
            delegate: MySliverAppbar(min: 140, max: 280),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item $index'),
              ),
              childCount: 20,
            ),
          ),
          //Some Child Widget
        ],
      ),
    );
  }
}

class MySliverAppbar extends SliverPersistentHeaderDelegate {
  final double min;
  final double max;
  MySliverAppbar({
    required this.min,
    required this.max,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipPath(
      clipper: MyClip(),
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

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}

class MyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    final bezierStartPoint = Offset(0, size.height * .75);
    final bezierControlPoint = Offset(size.width * .4, size.height);
    final bezierEndPoint = Offset(size.width, size.height / 2);

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
    return true;
  }
}
