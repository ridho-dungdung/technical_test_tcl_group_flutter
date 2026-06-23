import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget loadingShimmer(BuildContext context) {
  double widthLayout = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for(int i=0; i<3; i++) Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.white,
            child: Container(
              margin: EdgeInsets.only(top: 14,),
              height: 180,
              width: widthLayout,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16)
              ),
            )
        ),
      ],
    ),
  );
}