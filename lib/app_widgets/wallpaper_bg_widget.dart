import 'package:flutter/material.dart';

class WallpaperBgWidget extends StatelessWidget{
  double mWidth;
  double mheight;
  String imgUrl;
  WallpaperBgWidget({required this.imgUrl,this.mWidth=150,this.mheight=250});
  @override

  Widget build(BuildContext context) {
    return Container(
      width: mWidth,
      height: mheight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: NetworkImage(imgUrl),fit: BoxFit.cover)
      ),
    );
  }

}