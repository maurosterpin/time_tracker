import 'package:flutter/cupertino.dart';
import 'package:time_tracker/widgets/button.dart';

class SocialSignInButton extends CustomButton {
  SocialSignInButton({
    String? assetName,
    String? text,
    required Color color,
    Color? textColor,
    required VoidCallback onPressed,
  }) : assert(text !=null), assert(assetName !=null), super (
        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(assetName!),
                Text(text!, style: TextStyle(color: textColor, fontSize: 15),),
                Opacity(opacity: 0 ,child: Image.asset('assets/google-logo.png')),
              ], 
            ),
        color: color,
        onPressed: onPressed,
      );
}