import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Clip clipBehavior;
  final Color color;
  final Widget child;
  final double elevation;

  CustomCard({@required this.child, this.color = Colors.white, this.clipBehavior = Clip.none, this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: child,
      color: color,
      clipBehavior: clipBehavior,
      elevation: elevation,
    );
  }
}
