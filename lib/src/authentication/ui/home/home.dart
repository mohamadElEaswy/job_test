import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/google_signin_api.dart';
import '../login/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final GoogleSignInAccount user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton(
              onPressed: () => signOut(context), child: const Text('log out'))
        ],
      ),
      body: Center(
        child: Text('Hello ${user.email}'),
      ),
    );
  }

  Future signOut(BuildContext context) async {
    await GoogleSignInApi.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
