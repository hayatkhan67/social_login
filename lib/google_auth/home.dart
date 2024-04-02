import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleAuthHome extends StatelessWidget {
  GoogleAuthHome({super.key});
// UserCredential userCredential= FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(FirebaseAuth.instance.currentUser!.photoURL.toString())
        ],
      ),
    );
  }
}
