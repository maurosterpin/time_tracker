import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_tracker/widgets/showAlertDialog.dart';

Future<void> showExceptionAlertDialog(
  BuildContext context, {
    required String title,
    required Exception exception,
  }) => showAlertDialog(
    context, 
    title: title, 
    contant: _message(exception),
    defaultActionText: 'OK',
    );

String _message(Exception exception) {
  if(exception is FirebaseException) {
    return exception.message.toString();
  }
  return exception.toString();
}
