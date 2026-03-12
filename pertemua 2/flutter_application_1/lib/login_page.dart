import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // --- Untuk Logika
  bool _isFav = true;

  void _toggleFavorite() {
    // Logika untuk toggle favorite
    setState(() {
      _isFav = !_isFav;
    });
    // print("Favorite toggled")
  }

  // Logika Form Input
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  void _handleLogin(String username) {
    // logika Benar
    if (_usernameController.text == "123" &&
        _passwordController.text == "1234") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Berhasil Masuk")));

      // push replacement itu fungsi untuk halaman home yang nggak bisa kembali (back) ke bagian login
      // push aja itu dari home masih bisa balik ke halaman login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(username)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text("Gagal")),
      );
    }
  }

  // untuk build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Twitter',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 80, 95, 189),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Image.asset('aset/download (1).jpg'),
                    SizedBox(height: 16),

                    IconButton(
                      onPressed: _toggleFavorite,
                      icon: Icon(
                        Icons.favorite,
                        color: _isFav ? Colors.red : Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),

                    // == Username Input
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // == Password Input
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),

                    // Button
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _handleLogin(_usernameController.text);
                        },
                        child: Text('Login'),
                      ),
                    ),

                    // Tulisan Lupa Password
                    TextButton(
                      onPressed: () {},
                      child: Text('Forgot password?'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
