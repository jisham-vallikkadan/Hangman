import 'package:flutter/material.dart';

Widget hangimage(String path, bool visibel) {
  return Visibility(
    visible: visibel,
    child: Container(
      width: 250,
      height: 250,
      child: Image.asset(path),
    ),
  );
}

Widget letter(String letter,bool hide) {
  return Container(
    width: 40,
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.black26,
    ),
    child: Visibility(
      visible: !hide,
      child: Center(
        child: Text('$letter',style: TextStyle(color: Colors.white),),
      ),
    ),
  );
}



class gamelogic{
 static  int test=0;
 static List<String> selectedtest=[];
}