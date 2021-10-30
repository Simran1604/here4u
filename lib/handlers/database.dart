import 'package:cloud_firestore/cloud_firestore.dart';

class databasebase{
  final String uid;
  databasebase({required this.uid});
  
  //firestore instance
  

  Future createNewuser(String name,String email, String password) async
  {
    
  }

   updateName(String name)
  {
    final CollectionReference db=FirebaseFirestore.instance.collection('Name');
     db.doc(uid).set({'name':name});
  }
}