import 'package:flutter/material.dart';

void loadingDialog(BuildContext context) {
   showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            content: Padding(
              padding: const EdgeInsets.only(top: 8,),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                  Divider(height: 20,),
                  Text('Loading...',
                    style: TextStyle(color: Colors.lightBlue),
                  )
                ],
              ),
            ),
          )
        );
      }
  );
}