import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chatapp/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Authmethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");

  get context => null;
  Future<String> signinuser(
    String email,
    String password,
  ) async {
    String res = "Some errr occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "please enter all fields";
        showSnackbar(context, Color(0xFFee7b64), res);
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> signupuser(
      String fullName, String email, String password) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty && fullName.isNotEmpty) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print("Good");
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': fullName,
          'uid': cred.user!.uid,
          'email': email,
          'password': password,
          "profilePic": "",
        });
        res = "success";
        print("res");
      } else {
        res = "Please enter all fields";
        showSnackbar(context, Color(0xFFee7b64), res);
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
  Future<void> followusr(
  String uid,
  String followid,
)async{
try{
DocumentSnapshot snap=await _firestore.collection('users').doc(uid).get();
List following = (snap.data()! as dynamic)['following'];
if(following.contains(followid)){
  await _firestore.collection('users').doc(followid).update({
    'followers':FieldValue.arrayRemove([uid]),
  });
   await _firestore.collection('users').doc(uid).update({
    'following':FieldValue.arrayRemove([followid]),
  });
}
else{
   await _firestore.collection('users').doc(followid).update({
    'followers':FieldValue.arrayUnion([uid]),
  });
   await _firestore.collection('users').doc(uid).update({
    'following':FieldValue.arrayUnion([followid]),
  });
}
}catch(e){
  print(e);
}
}
}
