import 'package:coffee_firebase/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();
    
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            }, 
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: Text(
              'logout', 
              style: TextStyle(
                color: Colors.black,
              ), 
            ),
          ),
        ],
      ),
    );
  }
}