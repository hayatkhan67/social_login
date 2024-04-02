import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_login/home.dart';
import 'package:social_login/utils.dart';

class Otp extends StatelessWidget {
  Otp({super.key, required this.verificationId});
  final _controller = TextEditingController();
  final String verificationId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Enter Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            smsCode: _controller.text,
                            verificationId: verificationId);
                    UserCredential userCredential =
                        await auth.signInWithCredential(credential);
                    User? user = userCredential.user;
                    if (user != null) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ));
                    } else {
                      Utils.showMessage('Something is wrong');
                    }
                  } on FirebaseAuthException catch (e) {
                    Utils.showMessage(e.code.toString());
                  }
                },
                child: const Text('Verify')),
          ],
        ),
      ),
    );
  }
}
