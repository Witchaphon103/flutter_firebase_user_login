import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/create_account_screen.dart';
import 'package:flutter_firebase_auth/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;
    //TODO:
    //1. Add your login logic here
    //3. If login success -> Navigate to home screen
    //4. If login failed -> Show error message to user

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate to the forgot password screen
                  },
                  child: const Text('Forgot password?',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      )),
                ),
                const Text(
                  ' or ',
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the create account screen
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CreateAccountScreen();
                    }));
                  },
                  child: const Text(
                    'create account',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
