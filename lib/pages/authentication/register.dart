import 'package:beautopia_project/pages/authentication/services/authentication_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isChecked = false;
  bool _agreedToTerms = false;
  bool _passwordsMatch = true;

  Future<void> registerUser(BuildContext context) async {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text;
    String repeatPassword = _repeatPasswordController.text;

  if(password==repeatPassword) {
  await _authService.registerUser(email, password, repeatPassword, username);
  Navigator.pushNamed(context, '/signin');
  } else {
  showDialog(
  context: context,
  builder: (BuildContext context) {
  return AlertDialog(
  title: Text('Error'),
  content: Text('Passwords do not match.'),
  actions: [
  TextButton(
  child: Text('OK'),
  onPressed: () {
  Navigator.pop(context);
  },
  ),
  ],
  );
  },
  );
  }
}

  void _toggleAgreeToTerms(bool value) {
    setState(() {
      _agreedToTerms = value;
    });
  }

  void _checkPasswordMatch(String password, String repeatPassword) {
    setState(() {
      _passwordsMatch = password == repeatPassword;
    });
  }

  void _validateFields(BuildContext context) {
    if (_usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _repeatPasswordController.text.isEmpty ||
        !_agreedToTerms) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill out all your information'),
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
    } else if (!_passwordsMatch) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text("The passwords don't match!"),
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
      // Perform action on continue button press
      Navigator.pushReplacementNamed(
        context,
        '/signin',
        arguments: {
          'email': _emailController.text,
          'password': _passwordController.text,
        },
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.teal,
                  ),
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your username',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
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
                    hintStyle: TextStyle(color: Colors.grey),
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
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  onChanged: (value) {
                    _checkPasswordMatch(value, _repeatPasswordController.text);
                  },
                ),
                SizedBox(height: 20.0),
                Text(
                  'Repeat Password',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.teal,
                  ),
                ),
                TextFormField(
                  controller: _repeatPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password again',
                    hintStyle: TextStyle(color: Colors.grey),
                    errorText: _passwordsMatch ? null : "The passwords don't match!",
                  ),
                  onChanged: (value) {
                    _checkPasswordMatch(_passwordController.text, value);
                  },
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Checkbox(
                      value: _agreedToTerms,
                      onChanged: (bool? value) {
                        _toggleAgreeToTerms(value ?? false);
                      },
                      shape: CircleBorder(),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'I agree to the ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Terms of Services',
                            style: TextStyle(color: Colors.red),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (!_agreedToTerms)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'You must agree to our Terms of Services and Privacy Policy',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                SizedBox(height: 40.0),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => registerUser(context),
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an Account?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        // Perform action on sign in link press
                        Navigator.pushReplacementNamed(context, '/signin');
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/logo.png',
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

