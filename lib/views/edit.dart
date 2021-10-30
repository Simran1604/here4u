import 'package:flutter/material.dart';
import 'package:here4u/views/dashboard.dart';
import 'package:here4u/widgets/TextCard.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text("Edit"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                child: Image.asset("assets/edit.png"),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 5),
            Text("Tell Us About Your Problem", style: TextStyle(fontSize: 25)),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter text",
                ),
                maxLines: null,
                controller: myController,
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => dashboard()));
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
