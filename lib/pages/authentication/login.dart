import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn(BuildContext context) {
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
  }

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
              onPressed: () => _signIn(context),
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
            SizedBox(height: 20.0),
            Text(
              'or use other profiles',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () => _launchEmailApp(context),
              icon: Icon(Icons.mail, color: Colors.white),
              label: Text(
                'Mail',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
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
