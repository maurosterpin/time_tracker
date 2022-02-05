import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({ Key? key, required this.child, required this.color, this.borderRadius = 5, this.height = 50, required this.onPressed }) : super(key: key);

  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
              child: child, 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
              color: color,
              onPressed: onPressed,
              ),
    );
  }
}