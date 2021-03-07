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

class CustomAppBarWithTab extends PreferredSize {
  // final Widget child;
  final Widget title;
  final double height;
  final TabBar bottom;
  final color;
  CustomAppBarWithTab(
      {this.height, this.color, @required this.title, this.bottom});
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title,
          new PreferredSize(
              child: bottom, preferredSize: Size(double.infinity, 30))
        ],
      ),
    );
  }
}

/****
 
 AppBar(
        
        title: title,
        bottom: new PreferredSize(
            child: bottom, preferredSize: Size.fromHeight(50)),
      ),
 */
