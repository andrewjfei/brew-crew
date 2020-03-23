import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;

  DatabaseService({this.uid});

  // Collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .document(uid)
        .setData({'sugars': sugars, 'name': name, 'strength': strength});
  }
  
  // Brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '', // If the document doesnt have a name return an empty string
        sugars: doc.data['sugars'] ?? '0', // If the document doesnt have a sugars return an '0'
        strength: doc.data['strength'] ?? 0, // If the document doesnt have a strength return 0
        );
    }).toList();
  }

  // Get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
      .map((snapshot) => _brewListFromSnapshot(snapshot));
  }
  
}
