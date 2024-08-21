class Food {
  String uid;
  String Name;
  int Price;
  String Location;
  String image;
  bool paid;

  Food({this.uid, this.Name, this.Price, this.Location, this.paid, this.image});
  Food.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    Name = data['Name'];
    Price = data['Price'];
    Location = data['Location'];
    paid = data['paid'];
    image = data['image'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'Name': Name,
      'Price': Price,
      'Location': Location,
      'Paid': paid
    };
  }
}

class Cart {
  String uid;
  String Name;
  int Price;
  String Location;
  bool paid;
  String image;
  int quantity;

  Cart(
      {this.uid,
      this.Name,
      this.Price,
      this.Location,
      this.paid,
      this.image,
      this.quantity});
  Cart.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    Name = data['Name'];
    Price = data['Price'];
    Location = data['Location'];
    paid = data['paid'];
    image = data['image'];
    quantity = data['quantity'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'Name': Name,
      'Price': Price,
      'Location': Location,
      'Paid': paid,
      'image': image,
      'quantity': quantity
    };
  }
}
