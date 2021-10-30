import 'package:flutter/material.dart';
import 'package:here4u/widgets/TextCard.dart';

import 'edit.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
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
          backgroundColor: Colors.grey.shade900,
          leading: Icon(Icons.logout),
          title: Text("Other Stories"),
          actions: <Widget>[
            TextButton.icon(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Edit()));
                },
                icon: Icon(Icons.edit),
                label: Text("Edit")),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    child: Image.asset("assets/dashboard.png"),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                card(),
                card(),
                card(),
                card(),
                card(),
                card(),
                card(),
                card(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
