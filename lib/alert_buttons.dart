import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlertButtons extends StatelessWidget{
  final Widget child;
  final Function onPressed;
  final Color color;
  final double width;
  final double height;
  final BorderRadius radius;

  AlertButtons({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.color,
    this.width,
    this.height = 40.0,
    this.radius
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        borderRadius: radius ?? BorderRadius.circular(4.0)
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}