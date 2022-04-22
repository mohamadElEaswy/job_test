import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_test/src/authentication/core/google_signin_api.dart';
import 'package:job_test/src/authentication/ui/home/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: ElevatedButton.icon(
            icon: const FaIcon(FontAwesomeIcons.google),
            label: const Text('Google login'),
            onPressed: () => signIn(context),
          ),
        ),
      );

  Future signIn(BuildContext context) async {
    final GoogleSignInAccount? user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Sign in failed')));
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(user: user),
        ),
      );
    }
  }


}
