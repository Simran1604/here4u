import 'package:cloud_firestore/cloud_firestore.dart';

class databasebase{
  final String uid;
  databasebase({required this.uid});
  
  //firestore instance
  

  Future createNewuser(String name,String email, String password) async
  {
    
  }

   updateIssue(String issue)
  {
    final CollectionReference db=FirebaseFirestore.instance.collection('issue');
     db.doc(uid).set({'issue':issue});
  }
}