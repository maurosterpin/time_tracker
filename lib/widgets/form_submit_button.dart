import 'package:flutter/material.dart';
import 'package:time_tracker/widgets/button.dart';

class FormSubmitButton extends CustomButton {
  FormSubmitButton({
    required String text,
    required VoidCallback onPressed,

  }) : super (
    child: Text(
      text, 
      style: TextStyle(color: Colors.white, fontSize: 20),
      ), 
      height: 44,
      color: Colors.indigo,
      borderRadius: 4,
      onPressed: onPressed
      );
}