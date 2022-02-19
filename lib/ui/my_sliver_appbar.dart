import 'package:elastic_search_bar/ui/search_textfield.dart';
import 'package:flutter/material.dart';

import 'clipy_background.dart';

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
    /// if [shrinkOffset] = 0 -> isExtended
    var adjustedShrinkOffset =
        shrinkOffset > minExtent ? minExtent : shrinkOffset;
    var offset = (minExtent - adjustedShrinkOffset) * .5;
    var toppad = MediaQuery.of(context).padding.top + 26;
    var opacity = shrinkOffset > 0 ? 0.0 : 1.0;
    return Stack(
      children: [
        ClipyBackground(min: min, max: max),
        Positioned(
          top: toppad + offset,
          left: 16,
          right: 16,
          child: const SearchTextField(),
        ),
        Positioned(
          top: 36,
          left: 16,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 0),
            opacity: opacity,
            curve: Curves.easeInOutQuint,
            child: const Text(
              'Let\'s Find something',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ],
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
