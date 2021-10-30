import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:here4u/views/dashboard.dart';
import 'package:here4u/handlers/database.dart';
import 'package:here4u/widgets/TextCard.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  final myController = TextEditingController();
  var user= FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text("Edit"),
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
           const SizedBox(height: 5),
            const Text("Feel free to share your issues with us.", style: TextStyle(fontSize: 20)),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('We promise your identity won\t be revealed.',style: TextStyle(fontSize: 15),),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Share...",
                ),
                maxLines: null,
                controller: myController,
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {databasebase(uid: user).updateStory(myController.text);
                myController.clear();
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
