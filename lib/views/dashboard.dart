
// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:here4u/views/edit.dart';
import 'package:here4u/views/home.dart';
import 'package:here4u/widgets/TextCard.dart';

import 'edit.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  var _cardFuture;
  @override

    void initState() {
    super.initState();
  }


  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          accentColor: Colors.blueAccent,
          primaryColor: const Color(0xFF0A0E21),
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
          tabBarTheme: const TabBarTheme(labelColor: Colors.blueAccent)),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Hero(
              tag: 'main',
              child: Image(
                  height: 100,
                  width: 100,
                  image: AssetImage('assets/logo.png'))),
          backgroundColor: Color(0xFF1D1E33),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Edit()));
              },
              icon: Icon(Icons.edit),
              color: Colors.blueAccent,
            ),
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.blueAccent,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => home(),
                ));
              },
            )
          ],
        ),
         body:Center(
           child: Column(
        children:[StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('stories').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Center(child: CircularProgressIndicator());
      } else { 
        final stories=snapshot.data!.docs;
        List<card> storyList=[];
        for(var story in stories){
          final storyData=story.get('story');
          storyList.add(card(storyData));
        }
        return Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical:10,horizontal: 8 ),
            children: storyList,
          ),
        );}
    })
        ]
         ),)
    ),);

  }
}
