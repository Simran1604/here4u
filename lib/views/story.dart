import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class story extends StatefulWidget {

  String text;
   story(this.text,  { Key? key }) : super(key: key);
   
  

  @override
  _storyState createState() => _storyState(text: text);
}


class _storyState extends State<story> {

  String text;
  _storyState({Key? key, required this.text});

    final Icon _icon1 = const Icon(
    Icons.favorite_border,
    color: Colors.blueAccent,
  );
  final Icon _icon2 = const Icon(
    Icons.favorite,
    color: Color(0xFFE91E63),
  );
  final Icon _icon3 = const Icon(
    Icons.celebration_outlined,
    color: Colors.blueAccent
  );
  final Icon _icon4 = const Icon(
    Icons.celebration,
    color: Color(0xFFFFAB00),
  );
  bool icon = false,icon2=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E33),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height/1.1,
          width: MediaQuery.of(context).size.width/1.1,
          child: ListView(
            children: [
              const Center(
                child: CircleAvatar(
                  child: Image(image: AssetImage('assets/dp.png')),
                ),
              ),
              const SizedBox(height: 25,),
              Center(child: Text(text,
              textAlign: TextAlign.center,
              style:const TextStyle(
                            wordSpacing: 1,
                          letterSpacing: 0.5,
                          fontSize: 16
                          ),)),
                          Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              icon = !icon;
                            });
                          },
                          icon: icon ? _icon2 : _icon1,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              icon2 = !icon2;
                            });
                          },
                          icon: icon2 ? _icon4 : _icon3,
                        )
                      ],
                    )
                  ],
                ),
            ],
          ),),
      ),
    );
  }
}