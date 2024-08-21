import 'package:flutter/material.dart';
import 'package:project_firebase/model/food.dart';

import 'package:project_firebase/services/firestore_product.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'checkoutPage.dart';

class cartPage extends StatefulWidget {
  @override
  _cartPageState createState() => _cartPageState();
}

var ind = 0;

class _cartPageState extends State<cartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [],
      ),
      body: FutureBuilder<List<Cart>>(
        future: product().readCartData(),
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
                            height: 100,
                            child: Image.asset(snapshot.data[index].image),
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
                            'Quantity: ' +
                                snapshot.data[index].quantity.toString(),
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                          Text(
                            'Price: \$${snapshot.data[index].Price}',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                          if (snapshot.data[index].paid == false)
                            Text(
                              'Payment status: Pending',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                          if (snapshot.data[index].paid == true)
                            Text(
                              'Payment status: Payment made',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                        ],
                      ),
                      if (snapshot.data[index].paid == false)
                        IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            setState(() {
                              product()
                                  .deleteCartData(snapshot.data[index].uid);
                            });
                            Fluttertoast.showToast(
                                msg: snapshot.data[index].Name +
                                    " deleted successfully",
                                gravity: ToastGravity.TOP);
                          },
                        ),
                      if (snapshot.data[index].paid == false)
                        IconButton(
                          icon: Icon(Icons.shop),
                          onPressed: () {
                            mydata data = mydata(
                                snapshot.data[index].uid,
                                snapshot.data[index].Location,
                                snapshot.data[index].Name,
                                snapshot.data[index].Price,
                                snapshot.data[index].image,
                                snapshot.data[index].paid.toString(),
                                snapshot.data[index].quantity);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => checkOut(data: data),
                              ),
                            );
                          },
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
    );
  }
}

class mydata {
  final String id;
  final String paymentStatus;
  final String name;
  final int price;
  final String image;
  final String location;
  final int quantity;
  mydata(this.id, this.location, this.name, this.price, this.image,
      this.paymentStatus, this.quantity);
}
