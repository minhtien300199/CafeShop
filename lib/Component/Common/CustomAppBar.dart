import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final Widget child;
  final double height;
  final color;
  CustomAppBar({@required this.child, this.height, this.color});
  @override
  Size get preferredSize => Size.fromHeight(height);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
