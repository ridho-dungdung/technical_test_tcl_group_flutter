import 'package:flutter/material.dart';

void snackbarScaffoldError(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      dismissDirection: DismissDirection.up,
      duration: Duration(milliseconds: 1000),
      backgroundColor: Colors.red,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height-200,
        left: 12,
        right: 12
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(14)
      ),
      content: Text('Opss $message',
        style: TextStyle(fontSize: 20, color: Colors.white),
      )
  ));
}