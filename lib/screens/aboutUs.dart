import 'package:flutter/material.dart';
import 'package:project_firebase/screens/home_page.dart';
import 'package:project_firebase/screens/addrecord_page.dart';
import 'package:project_firebase/screens/inCartpage.dart';
import 'package:project_firebase/screens/product.dart';

import 'package:project_firebase/screens/settings.dart';
import 'package:project_firebase/services/firebaseauth_service.dart';
import 'package:project_firebase/services/firestore_product.dart';

class aboutus extends StatefulWidget {
  @override
  _aboutusState createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10),
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Turpis egestas maecenas pharetra convallis posuere morbi leo urna molestie. Ac odio tempor orci dapibus. Mauris rhoncus aenean vel elit scelerisque. Suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque. Risus in hendrerit gravida rutrum quisque. Eget arcu dictum varius duis. Volutpat sed cras ornare arcu dui. Massa placerat duis ultricies lacus sed turpis tincidunt id aliquet. Egestas egestas fringilla phasellus faucibus scelerisque eleifend donec. Integer vitae justo eget magna fermentum iaculis.  Adipiscing bibendum est ultricies integer quis. Et magnis dis parturient montes nascetur ridiculus mus mauris. Habitant morbi tristique senectus et. Tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi. Diam quam nulla porttitor massa id neque aliquam vestibulum morbi. Duis at tellus at urna condimentum mattis pellentesque id nibh. Ipsum nunc aliquet bibendum enim facilisis gravida neque convallis. Mattis vulputate enim nulla aliquet. Tincidunt tortor aliquam nulla facilisi cras fermentum odio eu. Et malesuada fames ac turpis. Odio euismod lacinia at quis. Molestie at elementum eu facilisis sed odio morbi. Viverra maecenas accumsan lacus vel facilisis volutpat est. Ut sem viverra aliquet eget sit amet tellus cras. Lacus sed turpis tincidunt id aliquet. Arcu ac tortor dignissim convallis.'),
                ),
              ],
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
