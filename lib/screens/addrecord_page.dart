import 'package:flutter/material.dart';
import 'package:project_firebase/model/feedback.dart';
import 'package:project_firebase/screens/home_page.dart';
import 'package:project_firebase/screens/inCartpage.dart';
import 'package:project_firebase/screens/product.dart';
import 'package:project_firebase/screens/settings.dart';
import 'package:project_firebase/screens/showrecords_page.dart';
import 'package:project_firebase/services/firebaseauth_service.dart';
import 'package:project_firebase/services/firestore_product.dart';
import 'package:project_firebase/services/firestore_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'aboutUs.dart';

class AddRecordPage extends StatefulWidget {
  @override
  _AddRecordPageState createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  String FeedbackAuthor;
  String FeedbackTitle;
  String FeedbackDescription;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        actions: [
          IconButton(
              icon: Icon(Icons.feedback_outlined),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RecordsPage(),
                  ),
                );
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (val) => val.length == 0 ? "Enter Name" : null,
                  onSaved: (val) => this.FeedbackAuthor = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Feedback'),
                  validator: (val) => val.length == 0 ? 'Feedback' : null,
                  onSaved: (val) => this.FeedbackDescription = val,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    onPressed: _submit,
                    child: Text('Send Feedback'),
                  ),
                ),
              ],
            ),
          ),
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

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    FirestoreService()
        .addFeedbackData(FeedbackAuthor, FeedbackTitle, FeedbackDescription);
    Fluttertoast.showToast(msg: "Feedback Sent", gravity: ToastGravity.TOP);
  } //_submit
}
