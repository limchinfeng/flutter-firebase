import 'package:coffee_firebase/models/user.dart';
import 'package:coffee_firebase/screens/anthenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Users?>(context);
    // print(user);
    
    return Authenticate();
  }
}