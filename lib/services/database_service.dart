import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream getFood() {
    return _firestore.collection('foods').snapshots();
  }

  Stream getOrders() {
    return _firestore.collection('orders').snapshots();
  }

  addOrder(foodName) async {
    await _firestore.collection('orders').add(
      {
        "foodName": foodName,
        "orderId": "",
        "userId": FirebaseAuth.instance.currentUser!.uid,
      },
    ).then((value) async {
      await _firestore.collection('orders').doc(value.id).update(
        {
          "orderId": value.id,
        },
      );
    });
  }

  deleteOrder(orderId) async{
    await FirebaseFirestore.instance.collection('orders').doc(orderId).delete();
  }
}
