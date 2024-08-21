import 'package:flutter/material.dart';
import 'package:project_firebase/screens/aboutUs.dart';
import 'package:project_firebase/screens/home_page.dart';
import 'package:project_firebase/screens/addrecord_page.dart';
import 'package:project_firebase/screens/inCartpage.dart';
import 'package:project_firebase/screens/product.dart';

import 'package:project_firebase/services/firebaseauth_service.dart';
import 'package:project_firebase/services/firestore_product.dart';

class contactUs extends StatefulWidget {
  @override
  _contactUsState createState() => _contactUsState();
}

class _contactUsState extends State<contactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: 500,
              child: Text(
                'You can contact us at kitsuneShopping@gmail.com ',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 500,
              child: Text(
                'or at +65 12345678',
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              child: Text(product().name, style: TextStyle(fontSize: 50)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => aboutus(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: const Text('Feedback'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddRecordPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.food_bank),
              title: const Text('Products'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => productPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: const Text('Cart'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => cartPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => contactUs(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign out'),
              onTap: () async {
                await FirebaseAuthService().signOut();
                Navigator.of(context).pushNamed('/login');
              },
            )
          ],
        ),
      ),
    );
  }
}
