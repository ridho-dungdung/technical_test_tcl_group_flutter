import 'package:flutter/material.dart';

Widget modalBottomSheetDelete(BuildContext context, String title) {
  return SizedBox(
    height: 260,
    child: Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 6),
            child: Text('Delete Task',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(color: Colors.grey,),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Are you sure you want to delete ',
                  style: TextStyle(fontSize: 18, color: Colors.black)
                ),
                TextSpan(
                  text: title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)
                ),
                TextSpan(
                  text: ' task ? ',
                  style: TextStyle(fontSize: 18, color: Colors.black)
                ),
              ]
            )),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14)
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text('Delete',
                        style: TextStyle(fontSize: 20,),
                      )
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}