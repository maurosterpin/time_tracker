import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';

Future<bool?> showAlertDialog(
  BuildContext context, {
    required String title,
    required String contant,
    required String defaultActionText,
  }) {
  if(!Platform.isIOS) {
    return showDialog(context: context, builder: (context) => AlertDialog(
      title: Text(title), content: Text(contant), actions: <Widget>[FlatButton(onPressed: () => Navigator.of(context).pop(true), child: Text(defaultActionText))],
    ));
  }
  return showCupertinoDialog(context: context, builder: (context) => CupertinoAlertDialog(
      title: Text(title), content: Text(contant), actions: <Widget>[CupertinoDialogAction(onPressed: () => Navigator.of(context).pop(true), child: Text(defaultActionText))],
    ));
}