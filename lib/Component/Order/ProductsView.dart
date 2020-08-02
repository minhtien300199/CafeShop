import 'package:flutter/material.dart';

class CustomGridView extends StatefulWidget {
  final List<Widget> priductWidgets;
  CustomGridView({this.priductWidgets});
  @override
  _CustomGridViewState createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverGrid(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              child: Text('data'),
            );
          }),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          )),
    );
  }
}
