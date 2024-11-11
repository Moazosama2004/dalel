import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/functions/functions.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          IconButton(
            onPressed: () async {
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
