import 'package:flutter/cupertino.dart';
import 'package:time_tracker/widgets/button.dart';

class SignInButton extends CustomButton {
  SignInButton({
    String? text,
    required Color color,
    Color? textColor,
    required VoidCallback onPressed,
  }) : assert(text !=null), super (
        child: Text(text!, style: TextStyle(color: textColor, fontSize: 15),),
        color: color,
        onPressed: onPressed,
      );
}