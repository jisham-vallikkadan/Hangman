import 'package:flutter/material.dart';
import 'package:hangman/handimage.dart';

class Hangman extends StatefulWidget {
  const Hangman({Key? key}) : super(key: key);

  @override
  State<Hangman> createState() => _HangmanState();
}

class _HangmanState extends State<Hangman> {
  @override
  String name = "Jisham".toUpperCase();
  List<String> alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9E3CEEFF),
      appBar:
          AppBar(title: Text('Hangman'), backgroundColor: Colors.black),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                hangimage('images/hang.png', gamelogic.test >= 0),
                hangimage("images/head.png", gamelogic.test >= 1),
                hangimage("images/body.png", gamelogic.test >= 2),
                hangimage("images/la.png", gamelogic.test >= 3),
                hangimage("images/ll.png", gamelogic.test >= 4),
                hangimage("images/ra.png", gamelogic.test >= 5),
                hangimage("images/rl.png", gamelogic.test >= 6),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: name
                  .split('')
                  .map((e) => letter(e.toUpperCase(),
                      !gamelogic.selectedtest.contains(e.toUpperCase())))
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.count(
              crossAxisCount: 6,
              padding: EdgeInsets.only(left: 10, right: 10),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              children: alphabet
                  .map((e) => Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: gamelogic.selectedtest.contains(e)?Colors.black:Colors.red),
                      child: TextButton(
                          onPressed:
                          gamelogic.selectedtest.contains(e)
                              ? null
                              :
                              () {
                                  setState(() {
                                    gamelogic.selectedtest.add(e);
                                    if(!name.split('').contains(e)){
                                      gamelogic.test++;
                                    }
                                  });
                                },
                          child: Text(e,style: TextStyle(color: Colors.white,fontSize: 20),))))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
