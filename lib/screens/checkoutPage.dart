import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_firebase/model/food.dart';
import 'package:project_firebase/services/firestore_product.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'inCartpage.dart';

class checkOut extends StatefulWidget {
  final mydata data;
  checkOut({Key key, @required this.data}) : super(key: key);
  @override
  State<checkOut> createState() => _checkOutState();
}

class _checkOutState extends State<checkOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check out page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            child: Text(
              'Payment method via credit card: ',
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
          ),
          TextField(
            maxLength: 12,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Card number',
                counterText: ''),
          ),
          Container(
            padding: EdgeInsets.all(4),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: 100,
                child: TextField(
                  maxLength: 3,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'cvv',
                      counterText: ''),
                ),
              ),
              Container(
                width: 100,
                padding: EdgeInsets.all(10),
                child: TextField(
                  maxLength: 5,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'date',
                      counterText: ''),
                ),
              ),
            ],
          ),
          RaisedButton(
            onPressed: () {
              setState(
                () {
                  product().updateCartData(
                      widget.data.name,
                      widget.data.price,
                      widget.data.location,
                      true,
                      widget.data.image,
                      widget.data.quantity);
                },
              );
              if (widget.data.paymentStatus == '1')
                Fluttertoast.showToast(
                    msg: "Payment is successful", gravity: ToastGravity.TOP);
            },
            child: Text('Payment'),
          ),
          Text(widget.data.id)
        ],
      ),
    );
  }
}
