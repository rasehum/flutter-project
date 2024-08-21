import 'package:flutter/material.dart';
import 'package:project_firebase/screens/aboutUs.dart';
import 'package:project_firebase/screens/product.dart';
import 'package:project_firebase/services/firebaseauth_service.dart';
import 'package:project_firebase/screens/addrecord_page.dart';

import 'package:project_firebase/screens/settings.dart';
import 'package:project_firebase/screens/profile.dart';
import 'package:project_firebase/screens/inCartpage.dart';
import 'package:project_firebase/services/firestore_product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("WELCOME HOME, " + product().name,
              style: TextStyle(fontSize: 30)),
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_bag),
                    iconSize: 60,
                    tooltip: 'Enter shopping cart',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          //builder: (context) => CPJsonParse(),
                          builder: (context) => productPage(),
                        ),
                      );
                    },
                  ),
                  Text('Food')
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.money),
                    iconSize: 60,
                    tooltip: 'View All Purchased items',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => cartPage(),
                        ),
                      );
                    },
                  ),
                  Text('Cart')
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.people),
                    iconSize: 60,
                    tooltip: 'About us',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => aboutus(),
                        ),
                      );
                    },
                  ),
                  Text('About Us')
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.phone),
                    iconSize: 60,
                    tooltip: 'Contact us',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => contactUs(),
                        ),
                      );
                    },
                  ),
                  Text('Contact us'),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.feedback),
                    iconSize: 60,
                    tooltip: 'Feedback',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddRecordPage(),
                        ),
                      );
                    },
                  ),
                  Text('Feedback')
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.person),
                    iconSize: 60,
                    tooltip: 'Profile',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => profile(),
                        ),
                      );
                    },
                  ),
                  Text('Profile')
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        backgroundColor: Colors.blueAccent,
        tooltip: 'Sign Out',
        onPressed: () async {
          await FirebaseAuthService().signOut();
          Navigator.of(context).pushNamed('/login');
        },
      ),
    );
  }
}
