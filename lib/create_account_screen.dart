import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/login_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _createAccount() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showErrorDialog("โปรดกรอกข้อมูลให้ครบถ้วน");
      return;
    }

    if (password != confirmPassword) {
      _showErrorDialog("รหัสผ่านไม่ตรงกัน");
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _showSuccessDialog("สมัครสมาชิกสำเร็จ!");
    } catch (e) {
      _showErrorDialog("เกิดข้อผิดพลาด: ${e.toString()}");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("ข้อผิดพลาด"),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text("ตกลง")),
        ],
      ),
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("สำเร็จ"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // กลับไปที่หน้า Login
            },
            child: Text("ตกลง"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Account')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'Password', border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                  labelText: 'Confirm Password', border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _createAccount,
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
