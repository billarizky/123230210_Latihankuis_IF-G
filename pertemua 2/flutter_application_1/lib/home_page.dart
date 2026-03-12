import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage(this.username, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Twitter',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 80, 95, 189),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (router) => false,
              );
            },

            icon: Icon(Icons.logout),
          ),
        ],
      ),

      body: Column(children: [Text((widget.username))]),
    );
  }
}
