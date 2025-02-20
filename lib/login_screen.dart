import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/home_screen.dart';
import 'package:flutter_firebase_auth/create_account_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog("โปรดกรอกอีเมลและรหัสผ่าน");
      return;
    }

    try {
      // ตรวจสอบการเข้าสู่ระบบด้วย Firebase
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // ไปยังหน้า Home หลังจากล็อกอินสำเร็จ
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      _showErrorDialog("เข้าสู่ระบบล้มเหลว: ${e.toString()}");
    }
  }

  Future<void> _resetPassword() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      _showErrorDialog("โปรดกรอกอีเมลของคุณ");
      return;
    }
    try {
      await _auth.sendPasswordResetEmail(email: email);
      _showSuccessDialog("ลิงก์รีเซ็ตรหัสผ่านถูกส่งไปที่อีเมลของคุณ");
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
              onPressed: () => Navigator.pop(context), child: Text("ตกลง")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
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
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'Password', border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text('Login')),
            TextButton(
                onPressed: _resetPassword, child: Text('Forgot Password?')),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateAccountScreen())),
              child: Text('Create Account',
                  style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline)),
            )
          ],
        ),
      ),
    );
  }
}
