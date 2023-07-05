import 'package:beautopia_project/pages/authentication/services/authentication_service.dart';
import 'package:flutter/material.dart';

import '../../custom_ui_elements/custom_error_alert_dialog.dart';
import '../../custom_ui_elements/custom_button.dart';
import '../../custom_ui_elements/custom_text_field.dart';
import '../../custom_ui_elements/custom_checkbox.dart';

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

  void _showErrorDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomErrorAlertDialog(
          title: title,
          content: content,
          onOkPressed: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  Future<void> registerUser(BuildContext context) async {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text;
    String repeatPassword = _repeatPasswordController.text;

    if (password == repeatPassword) {
      await _authService.registerUser(email, password, repeatPassword, username);
      Navigator.pushNamed(context, '/signin');
    } else {
      _showErrorDialog(context, 'Error', 'Passwords do not match.');
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
      _showErrorDialog(context, 'Error', 'Please fill out all your information');
    } else if (!_passwordsMatch) {
      _showErrorDialog(context, 'Error', "The passwords don't match!");
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
                SizedBox(height: 10.0),
                CustomTextField(
                  controller: _usernameController,
                  label: 'Username',
                ),
                SizedBox(height: 20.0),
                CustomTextField(
                  controller: _emailController,
                  label: 'Email',
                ),
                SizedBox(height: 20.0),
                CustomTextField(
                  controller: _passwordController,
                  label: 'Password',
                  obscureText: true,
                  onChanged: (value) {
                    _checkPasswordMatch(value, _repeatPasswordController.text);
                  },
                ),
                SizedBox(height: 20.0),
                CustomTextField(
                  controller: _repeatPasswordController,
                  label: 'Repeat Password',
                  obscureText: true,
                  errorText: _passwordsMatch ? null : "The passwords don't match!",
                  onChanged: (value) {
                    _checkPasswordMatch(_passwordController.text, value);
                  },
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    CustomCheckbox(
                      value: _agreedToTerms,
                      onChanged: (bool? value) {
                        _toggleAgreeToTerms(value ?? false);
                      },
                      activeColor: Colors.teal, // Set the active color to teal
                      checkColor: Colors.white, // Set the check color to white
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
                SizedBox(height: 20.0),
                Container(
                  width: double.infinity,
                  child: CustomButton(
                    onPressed: () => _validateFields(context),
                    text: 'Continue',
                    backgroundColor: Colors.teal,
                    textColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
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
