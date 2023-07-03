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

  /*void _signIn(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter email and password'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Perform sign-in logic here

      // Redirect the user to the Home Page
      // Replace '/home' with the actual route for your Home Page
      Navigator.pushReplacementNamed(context, '/');
    }
  }*/

  void _launchEmailApp(BuildContext context) async {
    const emailUrl = 'mailto:';
    if (await canLaunch(emailUrl)) {
      await launch(emailUrl);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to launch email app'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
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
    await _signInWithEmailAndPassword; // You missed the parentheses to call the function
    if (_authGoogle.signedInUser != null || _auth.currentUser != null) {
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
                  // Handle "Forgot Password?" action here
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
