import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_firebase/screens/product.dart';
import 'package:project_firebase/services/firestore_product.dart';

class detailPage extends StatefulWidget {
  final MyData2 data;
  detailPage({Key key, @required this.data}) : super(key: key);
  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  int quantity = 0;
  int price = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('details'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                child: Image.asset(widget.data.images),
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (quantity < 1) quantity;
                          if (quantity >= 0) quantity--;
                          if (quantity >= 0) price = price - widget.data.price;
                        });
                      }),
                  Text(
                    quantity.toString(),
                  ),
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity = quantity + 1;
                          price = quantity * widget.data.price;
                        });
                      })
                ],
              ),
              Container(
                padding: EdgeInsets.all(50),
                child: Text(
                  widget.data.name,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Price:' + price.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  widget.data.location,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              if (quantity > 0)
                RaisedButton(
                  onPressed: () {
                    setState(
                      () {
                        product().addcartData(
                            widget.data.name,
                            price,
                            widget.data.location,
                            widget.data.paid == '1',
                            widget.data.images,
                            quantity);
                      },
                    );
                    Fluttertoast.showToast(
                        msg: "Successfully added to cart",
                        gravity: ToastGravity.TOP);
                  },
                  child: Text('Add to cart'),
                )
            ],
          ),
        ],
      ),
    );
  }
}
