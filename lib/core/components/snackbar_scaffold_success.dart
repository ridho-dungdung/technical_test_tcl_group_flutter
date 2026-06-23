import 'package:flutter/material.dart';

void snackbarScaffoldSuccess(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      dismissDirection: DismissDirection.up,
      duration: Duration(milliseconds: 1000),
      backgroundColor: Colors.green,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height-240,
          left: 12,
          right: 12
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(14)
      ),
      content: Text('$message Successfully',
        style: TextStyle(fontSize: 20, color: Colors.white),
      )
  ));
}