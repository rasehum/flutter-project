import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_firebase/model/food.dart';
import 'package:project_firebase/screens/aboutUs.dart';
import 'package:project_firebase/screens/addrecord_page.dart';
import 'package:project_firebase/screens/detailPage.dart';
import 'package:project_firebase/screens/home_page.dart';
import 'package:project_firebase/screens/settings.dart';

import 'package:project_firebase/services/firebaseauth_service.dart';
import 'package:project_firebase/services/firestore_product.dart';

import 'inCartpage.dart';

class productPage extends StatefulWidget {
  @override
  _productPageState createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Food'),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_bag_outlined),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => cartPage(),
                  ),
                );
              })
        ],
      ),
      body: FutureBuilder<List<Food>>(
        future: product().readfoodData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 80,
                            child: Image.asset(
                              snapshot.data[index].image,
                            ),
                          ),
                          Container(
                            height: 40,
                            child: Text(
                              snapshot.data[index].Name,
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 30.0),
                            ),
                          ),
                          Text(
                            'Price:  \$' +
                                snapshot.data[index].Price.toString(),
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                          Text('Location: ' + snapshot.data[index].Location),
                        ],
                      ),
                      Container(
                        child: IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.add),
                          onPressed: () {
                            MyData2 data = MyData2(
                                snapshot.data[index].Name,
                                snapshot.data[index].Location,
                                snapshot.data[index].Price,
                                snapshot.data[index].paid.toString(),
                                snapshot.data[index].image);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => detailPage(
                                  data: data,
                                ),
                              ),
                            );

                            // setState(() {
                            //   product().addcartData(
                            //       snapshot.data[index].Name,
                            //       snapshot.data[index].Price,
                            //       snapshot.data[index].Location,
                            //       snapshot.data[index].paid == false);
                            // });
                            // Fluttertoast.showToast(
                            //     msg: "Successfully added to cart",
                            //     gravity: ToastGravity.TOP);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
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

class MyData2 {
  final String name;
  final int price;
  final String location;
  final String paid;
  final String images;
  MyData2(this.name, this.location, this.price, this.paid, this.images);
}
