// ignore_for_file: file_names, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

class card extends StatefulWidget {
   card({ Key? key }) : super(key: key);

   @override
   _cardState createState() => _cardState();
}

  class _cardState extends State<card> {

  final Icon _icon1=const Icon(Icons.favorite_border,color: Colors.blueAccent,);
  final Icon _icon2=const Icon(Icons.favorite,color: Color(0xFF4527A0),);
  bool icon=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(10)
          ),
          height: MediaQuery.of(context).size.height/3.5,
          width: MediaQuery.of(context).size.width/1.1,
          child: Column(
              children: [
                CircleAvatar(backgroundColor: Colors.blueAccent,),
                Expanded(child: 
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
                  ),),
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed:(){
                          setState((){
                            icon=!icon;
                          });
                        },
                        icon:icon?_icon2:_icon1 , )
                      ],
                    )
                  ],
                ),
              ],
          ),
      ),
    );
  }
}