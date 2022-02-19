import 'package:flutter/material.dart';

class AnotherScreen extends StatelessWidget {
  final int id;
  const AnotherScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: id,
          child: Text('Item $id'),
        ),
      ),
    );
  }
}
