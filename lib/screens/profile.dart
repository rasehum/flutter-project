import 'package:flutter/material.dart';
import 'package:project_firebase/services/firebaseauth_service.dart';
import 'package:project_firebase/services/firestore_product.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Email:' + FirebaseAuthService().email(),
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Name: ' + FirebaseAuthService().name(),
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
