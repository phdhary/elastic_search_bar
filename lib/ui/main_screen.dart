import 'package:flutter/material.dart';

import 'another_screen.dart';
import 'my_sliver_appbar.dart';

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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AnotherScreen(id: index)));
                },
                title: Hero(
                  tag: index,
                  child: Text('Item $index'),
                ),
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
