// ignore_for_file: file_names, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:here4u/views/home.dart';
import 'package:here4u/views/story.dart';


class card extends StatefulWidget {

  var storyData;
   card(this.storyData,  { Key? key }) : super(key: key);
   

  @override
  _cardState createState() => _cardState();
}

class _cardState extends State<card> {
    
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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFF1D1E33),
              borderRadius: BorderRadius.circular(10)),
          height: MediaQuery.of(context).size.height / 3.5,
          width: MediaQuery.of(context).size.width / 1.1,
          child: Column(
            children: [
              CircleAvatar(
                child: Image(image: AssetImage('assets/dp.png')),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                        widget.storyData,
                        style:const TextStyle(
                          wordSpacing: 1,
                        letterSpacing: 0.5,
                        fontSize: 16
                        ),),
                ),),
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
          ),
        ),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => story(widget.storyData)));
        },
      ),
    );
  }
}