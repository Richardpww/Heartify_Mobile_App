import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Segoe UI'),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() {
    // Equivalent to your JS alert
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Berhasil login sebagai: ${_usernameController.text}"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Allows scrolling if keyboard appears
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              
              // Header Image (Banner)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://via.placeholder.com/300x150', // Replace with your local banner
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 40),

              // Login Form
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  filled: true,
                  fillColor: const Color(0xFFEAEAEA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: const Color(0xFFEAEAEA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF19345C),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 40),
              const Text("Don't have an account?", style: TextStyle(color: Colors.grey)),
              TextButton(
                onPressed: () {},
                child: const Text('Create One', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              ),

              const SizedBox(height: 30),
              const Text("or login with", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),

              // Social Icons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialIcon('https://cdn-icons-png.flaticon.com/512/2991/2991148.png'),
                  const SizedBox(width: 20),
                  _socialIcon('https://cdn-icons-png.flaticon.com/512/733/733547.png'),
                  const SizedBox(width: 20),
                  _socialIcon('https://cdn-icons-png.flaticon.com/512/5969/5969020.png'),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for social circles
  Widget _socialIcon(String url) {
    return Container(
      width: 55,
      height: 55,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.lightBlueAccent.withOpacity(0.5), width: 2),
      ),
      child: Image.network(url, fit: BoxFit.contain),
    );
  }
}