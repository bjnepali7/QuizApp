import 'package:flutter/material.dart';

class PointDisplayContainer extends StatelessWidget {
  const PointDisplayContainer({this.child, super.key});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      height: 40,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(0xffF3F4F6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0, 4),
            blurRadius: 7,
          ),
        ],
      ),
      child: child,
    );
  }
}
