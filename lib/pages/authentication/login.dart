import 'package:beautopia_project/pages/authentication/services/google_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'services/authentication_service.dart';

class SignInPage extends StatelessWidget {
  final AuthService _auth = AuthService();
  final AuthGoogleService _authGoogle = AuthGoogleService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signInWithEmailAndPassword() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    await _auth.signIn(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 40.0),
              child: Image.asset(
                'assets/logo.png',
                width: 100.0,
                height: 100.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'Hi there. Welcome to Beautopia!',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'Email',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.teal,
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Password',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.teal,
              ),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),
    SizedBox(height: 20.0),
    ElevatedButton(
      onPressed: () async {
         _signInWithEmailAndPassword();
        if ( _authGoogle.signedInUser != null || _auth.currentUser != null)  {
          Navigator.pushNamed(context, '/');
        }
    },
    child: Text(
    'Sign In',
    style: TextStyle(
    fontSize: 18.0,
    color: Colors.white,
    ),
    ),
    style: ElevatedButton.styleFrom(
    primary: Colors.teal,
    padding: EdgeInsets.symmetric(vertical: 16.0),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
    ),
    ),
    ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: () async {
                await _authGoogle.signInWithGoogle();
                Navigator.pop(context);
              },
              child: Icon(
                Icons.mail,
                size: 70,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  // Handle "Register" action here
                  // Replace '/register' with the actual route for your Register Page
                  Navigator.pushReplacementNamed(context, '/register');
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
