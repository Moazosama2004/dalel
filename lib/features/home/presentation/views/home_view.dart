import 'package:dalel/core/functions/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              customPushReplacement(context, '/signupView');
            },
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
            ),
          )
        ],
      ),
    );
  }
}
