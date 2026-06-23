import 'package:flutter/material.dart';

Widget modalBottomSheetChangeStatus(BuildContext context) {
  List<String> selected = ['Pending', 'Done'];
  return SizedBox(
    height: 300,
    child: Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 6),
            child: Text('Status',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(color: Colors.grey,),
          for(String select in selected) Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14)
                      ),
                      onPressed: () {
                        Navigator.pop(context, select);
                      },
                      child: Text(select,
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