import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_firebase/model/feedback.dart';
import 'package:project_firebase/services/firebaseauth_service.dart';

class FirestoreService {
  // Create a CollectionReference called FeedbackCollection that references
  // the firestore collection
  final CollectionReference FeedbackCollection = FirebaseFirestore.instance
      .collection('feedback_' + FirebaseAuthService().email());
  final CollectionReference profileCollection = FirebaseFirestore.instance
      .collection('profile_' + FirebaseAuthService().id());
  Future<void> addFeedbackData(
      String name, String email, String message) async {
    var docRef = FirestoreService().FeedbackCollection.doc();
    print('add docRef: ' + docRef.id);
    await FeedbackCollection.doc(docRef.id)
        .set({'uid': docRef.id, 'name': name, 'message': message});
  } //addFeedbackData

  Future<List<feedback>> readFeedbackData() async {
    List<feedback> FeedbackList = [];
    QuerySnapshot snapshot = await FeedbackCollection.get();
    snapshot.docs.forEach((document) {
      feedback Feedback = feedback.fromMap(document.data());
      FeedbackList.add(Feedback);
    });
    print('Feedbacklist: $FeedbackList');
    return FeedbackList;
  } //readFeedbackData

  Future<void> deleteFeedbackData(String docId) async {
    FeedbackCollection.doc(docId).delete();
    print('deleting uid: ' + docId);
  } //deleteFeedbackData

  //for your reference
  Future<void> updateFeedbackData(
      String name, String email, String message) async {
    var docRef = FirestoreService().FeedbackCollection.doc();
    print('update docRef: ' + docRef.id);
    await FeedbackCollection.doc(docRef.id).update(
        {'uid': docRef.id, 'name': name, 'email': email, 'message': message});
  } //updateFeedbackData

  //for your reference
  Future<void> deleteFeedbackDoc() async {
    await FeedbackCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  } //deleteFeedbackDoc

}
