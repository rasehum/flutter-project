import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:project_firebase/model/food.dart';
import 'package:project_firebase/services/firebaseauth_service.dart';

class product {
  final CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('food');

  final CollectionReference cartCollection = FirebaseFirestore.instance
      .collection('Cart_' + FirebaseAuthService().id());

  String name = FirebaseAuthService().name();
  String email = FirebaseAuthService().email();
  //String phone = FirebaseAuthService().phone();
  Future<void> addcartData(String name, int Price, String Location, bool paid,
      String image, int quantity) async {
    var docRef = product().cartCollection.doc();
    print('add docRef: ' + docRef.id);
    await cartCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'Name': name,
      'Price': Price,
      'Location': Location,
      'paid': paid,
      'image': image,
      'quantity': quantity
    });
  }

  Future<List<Cart>> readCartData() async {
    List<Cart> foodList = [];
    QuerySnapshot snapshot = await cartCollection.get();
    snapshot.docs.forEach((document) {
      Cart food = Cart.fromMap(document.data());
      foodList.add(food);
    });
    print('foodlist: $foodList');
    return foodList;
  }

  Future<void> deleteCartData(String docId) async {
    cartCollection.doc(docId).delete();
    print('deleting uid: ' + docId);
  }

  Future<List<Food>> readfoodData() async {
    List<Food> foodList = [];
    QuerySnapshot snapshot = await foodCollection.get();
    snapshot.docs.forEach((document) {
      Food food = Food.fromMap(document.data());
      foodList.add(food);
    });
    print('foodlist: $foodList');
    return foodList;
  }

  Future<void> updateCartData(String name, int Price, String Location,
      bool paid, String image, int quantity) async {
    var docRef = product().cartCollection.doc();
    print('update docRef: ' + docRef.id);
    await cartCollection.doc(docRef.id).update(
      {
        'uid': docRef.id,
        'Name': name,
        'Price': Price,
        'Location': Location,
        'paid': paid,
        'image': image,
        'quantity': quantity
      },
    );
  }
}
