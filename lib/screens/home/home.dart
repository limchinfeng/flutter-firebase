import 'package:coffee_firebase/models/brew.dart';
import 'package:coffee_firebase/screens/home/brew-list.dart';
import 'package:coffee_firebase/screens/home/settings-form.dart';
import 'package:coffee_firebase/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee_firebase/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: SettingsForm(),
        );
      });
    }


    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService(uid:"").brews,
      initialData: null,
      child: Scaffold(
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
            TextButton.icon(
              icon: Icon(Icons.settings, color: Colors.black,),
              label: Text('settings', style: TextStyle(
                  color: Colors.black),
                ),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}